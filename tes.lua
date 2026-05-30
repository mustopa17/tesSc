-- Skrip Testing Menggunakan GitHub Raw
print("====================================")
print("Skrip dari GitHub Berhasil Dieksekusi!")
print("====================================")

-- Memunculkan notifikasi di pojok kanan bawah game
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "GitHub Test Sukses!";
    Text = "Koneksi HttpGet berjalan dengan lancar!";
    Duration = 7; -- Notifikasi muncul selama 7 detik
})