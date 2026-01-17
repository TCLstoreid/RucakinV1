import requests
import sys
import os

# Fungsi untuk membersihkan layar Termux
def clear_screen():
    os.system('clear')

# Fungsi inti Doxing IP
def doxing_ip(ip):
    # API endpoint (menggunakan ip-api.com untuk geolokasi)
    api_url = f"http://ip-api.com/json/{ip}?fields=status,message,country,countryCode,regionName,city,zip,lat,lon,timezone,isp,org,as,query"
    
    try:
        print(f"\n[!] ANJING! Mencari data untuk IP target: {ip}...")
        response = requests.get(api_url)
        data = response.json()
        
        if data['status'] == 'success':
            clear_screen()
            print("=========================================================")
            print(f"😡 HASIL DOXING IP - RUCAKIN TOOLS 😡")
            print("=========================================================")
            print(f"Target IP       : {data.get('query')}")
            print(f"Negara          : {data.get('country')}")
            print(f"Kode Negara     : {data.get('countryCode')}")
            print(f"Wilayah         : {data.get('regionName')}")
            print(f"Kota            : {data.get('city')}")
            print(f"Kode Pos        : {data.get('zip')}")
            print(f"Koordinat (Lat) : {data.get('lat')}")
            print(f"Koordinat (Lon) : {data.get('lon')}")
            print(f"Zona Waktu      : {data.get('timezone')}")
            print(f"ISP             : {data.get('isp')}")
            print(f"Organisasi      : {data.get('org')}")
            print(f"AS / ASN        : {data.get('as')}")
            print("=========================================================")
            print("\n[!] Selesai, memek. Data sudah di tangan lu.")
        else:
            print(f"\n[X] GAGAL, ANJING! Status: {data.get('message', 'Tidak diketahui')}")
            print("Cek lagi IP yang lu masukin, jangan-jangan IP lu sendiri lagi, goblok.")
            
    except requests.exceptions.RequestException as e:
        print(f"\n[X] KONTOL! Ada kesalahan koneksi. Pastikan lu punya internet, tolol: {e}")

if __name__ == '__main__':
    # Pastikan lu udah install library requests di Termux
    # $ pip install requests
    
    if len(sys.argv) != 2:
        clear_screen()
        print("=========================================================")
        print("RUCAKIN DOXING TOOL - PENCIPTA: RUCAKIN")
        print("=========================================================")
        print("😡 CARA PAKAI LU SALAH, GOBLOK! 😡")
        print("Usage: python doxing.py <IP_Address_Target>")
        print("Contoh: python doxing.py 8.8.8.8")
        sys.exit(1)
        
    target_ip = sys.argv[1]
    doxing_ip(target_ip)
