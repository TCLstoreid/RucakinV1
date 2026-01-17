#!/bin/bash
clear

# ================= WARNA =================
GRAY='\e[38;5;245m'
DARK='\e[38;5;240m'
GREEN='\e[1;32m'
NC='\033[0m'

# ================= FUNGSI CENTER =================
center_text() {
  text="$1"
  clean_text=$(echo -e "$text" | sed 's/\x1B\[[0-9;]*[mK]//g')
  cols=$(tput cols)
  padding=$(( (cols - ${#clean_text}) / 2 ))
  printf "%*s%b\n" "$padding" "" "$text"
}

# ================= GARIS =================
line() {
  cols=$(tput cols)
  printf "%*s\n" "$cols" "" | tr ' ' '━'
}

# ================= BANNER =================
echo -e "${GRAY}"
cat << "EOF"


██████╗ ██╗   ██╗ ██████╗ █████╗ ██╗  ██╗██╗███╗   ██╗
██╔══██╗██║   ██║██╔════╝██╔══██╗██║ ██╔╝██║████╗  ██║
██████╔╝██║   ██║██║     ███████║█████╔╝ ██║██╔██╗ ██║
██╔══██╗██║   ██║██║     ██╔══██║██╔═██╗ ██║██║╚██╗██║
██║  ██║╚██████╔╝╚██████╗██║  ██║██║  ██╗██║██║ ╚████║
╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ v1
 Code by TCLstore.id
 github: https://github.com/TCLstoreid

EOF
echo -e "${NC}"

line
center_text "${GREEN}TOOLS TERMUX - RUCAKIN${NC}"
line

# ================= MENU =================
echo -e "${RED}[ 01 ]${NC} Phishing Tool"
echo -e "${GREEN}[ 02 ]${NC} DDOS Attack"
echo -e "${BLUE}[ 03 ]${NC} DOXING"
echo -e "${RED}[ 04 ]${NC} OSINT"
echo -e "${DARK}[ 00 ]${NC} Keluar"

line
read -p "Pilih : " pilih

# ================= AKSI =================
case $pilih in
  1)
    echo -e "${GREEN}Menjalankan Phishing Tool [SABAR YA JING]...${NC}"
    sleep 3
    cd Tools
    git clone https://github.com/htr-tech/zphisher
    cd zphisher
    bash zphisher.sh
    ;;
  2)
    echo -e "${GREEN}Menjalankan Menu DDOS Attack [SABAR YA JING]...${NC}"
    sleep 3
    cd Tools
    git clone https://github.com/palahsu/DDoS-Ripper.git
    cd DDoS-Ripper
    python3 DRipper.py
    ;;
  3)
    pkg install python -y
    echo -e "${GREEN}Menjalankan Menu DOXING [SABAR YA JING]...${NC}"
    python3 tools/doxing.py
    echo
  read -p "Tekan ENTER untuk kembali ke menu..."
  ;;
  4)
  echo -e "${GREEN}Menjalankan Menu OSINT [OSINT COMMING SOON]...${NC}"
  ;;

  0)
    echo -e "${DARK}Keluar...${NC}"
    exit
    ;;
  *)
    echo -e "${DARK}Pilihan tidak valid!${NC}"
    ;;
esac
