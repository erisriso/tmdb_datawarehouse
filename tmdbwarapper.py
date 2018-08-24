from tmdbv3api import TMDb, Movie
import mysql.connector
from mysql.connector import MySQLConnection, Error, errorcode
import urllib.request
import json

tmdb = TMDb()
tmdb.api_key = 'XXXXX'

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="db_movie"
)

cursor = mydb.cursor()
#this function is to save data to fact table
def insert_film(id_film,judul_film,overview,poster,homepage,popularity,revenue,runtime,tagline,vote_average,vote_count,id_genre,id_bahasa,id_waktu,id_negara,id_person,id_company,review,budget):
    query = """INSERT INTO sma_tbl_fact_film (id_film,judul_film,overview,poster,homepage,popularity,revenue,runtime,tagline,
        vote_average,vote_count,id_genre,id_bahasa,id_waktu,id_negara,id_person,id_company,review,budget) 
        values(%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s,%s, %s, %s)"""
    args = (id_film,judul_film,overview,poster,homepage,popularity,revenue,runtime,tagline,vote_average,vote_count,id_genre,id_bahasa,id_waktu,id_negara,id_person,id_company,review,budget)

    try:
        cursor.execute(query, args)
        #print(cursor.statement)
        mydb.commit()
        print("Film "+judul_film+" berhasil disimpan")
    except Error as error:
        print(error)
 
    finally:
        print("  ")

		
#the function below is to save data genre movie
def insert_genre(id,name):
    sqlgenre = "insert ignore into sma_tbl_dimgenre(id_genre,nama_genre) values(%s,%s)"
    args = (id,name)

    try:
        cursor.execute(sqlgenre, args)
 
        mydb.commit()
        print("  Data genre "+name+" berhasil disimpan")
    except Error as error:
        print(error)
 
    finally:
        print("   ")

#the function below is to save time data from release date
def insert_waktu(a,b,c,tgl):
    sqlwaktu = "insert ignore into sma_tbl_dimwaktu(id_waktu,tanggal,bulan,tahun,tgl_lengkap) values(%s,%s,%s,%s,%s)"
    args = (tgl,c,b,a,tgl)

    try:
        cursor.execute(sqlwaktu, args)
        mydb.commit()
        print("  Data waktu "+tgl+" berhasil disimpan")
    except Error as error:
        print(error)
 
    finally:
        print("   ")

#save country data
def insert_contries(id,name):
    sqlprod = "insert ignore into sma_tbl_dimnegara(id_negara,nama_negara) values(%s,%s)"
    args = (id,name)
    #print("ID:"+id+"|nama:"+name)
    try:
        cursor.execute(sqlprod, args)
        mydb.commit()
        print("  Data production countries "+name+" berhasil disimpan")
    except Error as error:
        print(error)
    finally:
        print("   ")

#save company data
def insert_companies(id_companies,nama,negara,logo):
    sqlcom = "insert ignore into sma_tbl_dimcompanies(id_companies,nama,negara,logo) values(%s,%s,%s,%s)" 
    args = (id_companies,nama,negara,logo)

    try:
        cursor.execute(sqlcom, args)
        mydb.commit()
        print("  Data production companies "+nama+" berhasil disimpan")
    except Error as error:
        print(error)
 
    finally:
        print("   ")
		
#save person cast/artist/crew
def insert_person(id_person,nama,biography,popularity,pob,foto,job,birthday,homepage):
    sqlperson = """insert ignore into sma_tbl_dimperson (id_person,nama,biography,popularity,pob,foto,job,birthday,homepage)
            values(%s,%s,%s,%s,%s,%s,%s,%s,%s)""" 

    args = (id_person,nama,biography,popularity,pob,foto,job,birthday,homepage)

    try:
        cursor.execute(sqlperson, args)
        mydb.commit()
        print("  Data person "+nama+" berhasil disimpan")
    except Error as error:
        print(error)
 
    finally:
        print("   ")

#to get last movie id that in our database, if you want to get last movie in tmdb use API instead this function
def idTerakhir():
    sql="select CASE WHEN id_film IS NULL THEN 544061 ELSE MIN(id_film)-1 END id_movie from sma_tbl_fact_film"
    #
	cursor.execute(sql)
    for row in cursor:
        return row[0]

def main():
    movie = Movie()
    n=idTerakhir()
    
    while n > 353000: #353000 just a limit for iteration, may be changed to 1 for all movie id
        
        m = movie.details(n)
        try:
            if m==[] or m is None or m==() or m=="":
                print("Data film ini tidak ditemukan")
            else:
                id_movie=n
                attr = getattr(m, "original_title", None)
                if attr is not None:
                    judul=m.original_title
                    budget=m.budget
                    overview=m.overview
                    popularity=m.popularity
                    poster=m.poster_path
                    tglrelease=m.release_date
                    pendapatan=m.revenue
                    runtime=m.runtime
                    status = m.status
                    voteavrg = m.vote_average
                    votecount = m.vote_count
                    tagline = m.tagline
                    homepage = m.homepage                           
                    negaraproduksi = m.production_countries
                    bahasa=m.original_language
                    revenue=m.revenue
                    print("Mengambil Data Film "+judul)

                    for x in range(0,len(m.genres)):
                        insert_genre(m.genres[x]["id"],m.genres[x]["name"])
                        insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,m.genres[x]["id"],bahasa,1000000,1000000,1000000,1000000,"",budget)

                    xtanggal = m.release_date
                    if xtanggal!="":
                        a,b,c = xtanggal.split("-")
                        insert_waktu(a,b,c,xtanggal)
                        insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,1000000,bahasa,xtanggal,1000000,1000000,1000000,"",budget)
                    else:
                        print("Belum ada release data")

                    for z in range(0,len(m.production_companies)):
                        insert_companies(m.production_companies[z]["id"],m.production_companies[z]["name"],m.production_companies[z]["origin_country"],m.production_companies[z]["logo_path"])
                        insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,1000000,bahasa,1000000,1000000,1000000,m.production_companies[z]["id"],"",budget)
                    
                    
                    for y in range(0,len(m.production_countries)):
                        sqlprod = "insert ignore into sma_tbl_dimnegara(id_negara,nama_negara) values(%s,%s)"
                        args = (m.production_countries[y]["iso_3166_1"],m.production_countries[y]["name"])
                        cursor.execute(sqlprod, args)
                        mydb.commit()
                        insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,1000000,bahasa,1000000,m.production_countries[y]["iso_3166_1"],1000000,1000000,"",budget)
        
    
                    r = movie.reviews(n)
                    if r==[]:
                        print("Tidak ada data review")
                    else:
                        for h in range(0,len(r.results)):
                            dtreview = "Author: "+r.results[h]["author"]+"<br>"+r.results[h]["content"]
                            insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,1000000,bahasa,1000000,1000000,1000000,1000000,dtreview,budget)
    
    

                    c = movie.credits(n)
                    if c==[]:
                        print("Tidak ada data person")
                    else:
       
                        for dd in c.cast:
                            id_person   =dd["id"]
                            nama        =dd["name"]
                            job         ="Cast"
							with urllib.request.urlopen("https://api.themoviedb.org/3/person/"+str(id_person)+"?api_key=ee183266d8fc13c415cad996a43d03b1&language=en-US") as url:
                                c = json.loads(url.read().decode())
                                popularity  =c["popularity"]
                                pob         =c["place_of_birth"]
                                foto        =c["profile_path"]
                                birthday    =c["birthday"]
                                homepage    =c["homepage"]
                                biography   =c["biography"]
            
                            insert_person(id_person,nama,biography,popularity,pob,foto,job,birthday,homepage)
                            insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,1000000,bahasa,1000000,1000000,id_person,1000000,"",budget)
     
                    c = movie.credits(n)
                    if c==[]:
                        print("Tidak ada data person")
                    else:
                        for cc in c.crew:
                            id_person   =cc["id"]
                            nama        =cc["name"]
                            job         ="Crew"
                            with urllib.request.urlopen("https://api.themoviedb.org/3/person/"+str(id_person)+"?api_key=ee183266d8fc13c415cad996a43d03b1&language=en-US") as url:
                                c = json.loads(url.read().decode())
                                popularity  =c["popularity"]
                                pob         =c["place_of_birth"]
                                foto        =c["profile_path"]
                                birthday    =c["birthday"]
                                homepage    =c["homepage"]
                                biography   =c["biography"]
            
                            insert_person(id_person,nama,biography,popularity,pob,foto,job,birthday,homepage)
                            insert_film(id_movie,judul,overview,poster,homepage,popularity,revenue,runtime,tagline,voteavrg,votecount,1000000,bahasa,1000000,1000000,id_person,1000000,"",budget)
        except Error as error:
            print("Data film tidak ditemukan")
           
        n=n-1
    print("Proses selesai")
    print("======================================================")
    cursor.close()
    mydb.close()


if __name__ == '__main__':
    main()




