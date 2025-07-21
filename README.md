# 📊 Crypto Report Bot

Shell script untuk mengambil harga crypto utama (BTC, ETH, BNB, SOL, dll), persentase perubahan 24 jam & 7 hari, dan BTC Dominance dari CoinGecko, lalu mengirimkannya ke Telegram.

## ✨ Fitur

- Menampilkan harga koin (USD)
- Emoji tren naik 🚀 / turun 📉 / stabil 📈
- Persentase perubahan 24H dan 7D
- Kirim otomatis ke Telegram (via bot)
- Konfigurasi fleksibel via `.env`

## 🔧 Cara Install

### 1. Clone Repository

```bash
git clone https://github.com/username/crypto-report.git
cd crypto-report
```

### 2. Install Dependensi

```bash
sudo apt update
sudo apt install curl jq bc
```

### 3. Buat File `.env`

Buat file `.env` dengan isi berikut:

```env
BOT_TOKEN=isi_token_bot_anda
CHAT_ID=isi_chat_id_anda
COINS=bitcoin,ethereum,binancecoin,solana
SYMBOLS=BTC,ETH,BNB,SOL
```

- `BOT_TOKEN`: Dapatkan dari [@BotFather](https://t.me/BotFather)
- `CHAT_ID`: Gunakan ID channel atau grup (bisa pakai `@username` atau `-100...`)
- `COINS`: ID sesuai CoinGecko (pisahkan dengan koma)
- `SYMBOLS`: Simbol singkat, urutannya sesuai `COINS`

### 4. Jalankan Script

```bash
chmod +x crypto_report.sh
./crypto_report.sh
```

### 🕒 (Opsional) Cronjob

Untuk update otomatis tiap jam:

```bash
crontab -e
```

Tambahkan baris:

```bash
0 * * * * /path/to/crypto_report.sh
```

## 📌 Contoh Output

```
📊 Crypto Market Update

BTC Bitcoin
💰 $119458.00
📈 24H: 1.17%  |  📉 7D: -2.17%

ETH Ethereum
💰 $3792.94
📈 24H: 3.32%  |  🚀 7D: 25.38%

BNB BNB
💰 $762.22
📈 24H: 2.48%  |  🚀 7D: 9.33%

SOL Solana
💰 $189.52
🚀 24H: 6.19%  |  🚀 7D: 14.22%

🔥 BTC Dominance: 58.86%
```

## 📄 Lisensi

MIT License