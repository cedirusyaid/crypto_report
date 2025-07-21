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
git clone git@github.com:cedirusyaid/crypto_report.git
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
📊 Crypto Market Update (21 July 2025 - 18:56)
 #Bitcoin::: 💰 $118607.00
       📈 24H: 0.55%  |  📉 7D: -2.78%
 #Ethereum::: 💰 $3810.51
       📈 24H: 2.91%  |  🚀 7D: 24.97%
 #BNB::: 💰 $769.05
       📈 24H: 2.94%  |  📈 7D: 9.26%
 #Solana::: 💰 $191.15
       📈 24H: 6.14%  |  🚀 7D: 13.96%
🔥 BTC Dominance: 58.72%
```

## 📄 Lisensi

MIT License
