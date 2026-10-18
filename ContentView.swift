import SwiftUI

struct SettingsMainView: View {
    @State private var isAirplaneModeOn = false
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // Membentangkan latar belakang hitam menutupi seluruh piksel layar fisik secara mutlak
                Color.black
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea(.all)
                
                NavigationStack {
                    ZStack(alignment: .bottom) {
                        List {
                            // Section 1: Profil Akun Apple
                            Section {
                                HStack(spacing: 15) {
                                    Circle()
                                        .fill(LinearGradient(
                                            colors: [Color(red: 0.25, green: 0.55, blue: 0.65), Color(red: 0.1, green: 0.25, blue: 0.35)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 60, height: 60)
                                    
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text("Dimas Saputra")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.primary)
                                        Text("Akun Apple, iCloud, dan lainnya")
                                            .font(.system(size: 13))
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                            
                            // Section 2: Banner Perbarui iOS
                            Section {
                                HStack {
                                    Text("Perbarui ke iOS 27.0.1")
                                        .font(.system(size: 16))
                                    Spacer()
                                    ZStack {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 22, height: 22)
                                        Text("1")
                                            .font(.system(size: 13, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            // Section 3: Konektivitas & Baterai (Bluetooth Lengkap)
                            Section {
                                HStack {
                                    SettingsIcon(systemName: "airplane", backgroundColor: .orange)
                                    Text("Mode Pesawat").font(.system(size: 16))
                                    Spacer()
                                    Toggle("", isOn: $isAirplaneModeOn)
                                        .labelsHidden()
                                }
                                HStack {
                                    SettingsIcon(systemName: "wifi", backgroundColor: .blue)
                                    Text("Wi-Fi").font(.system(size: 16))
                                    Spacer()
                                    Text("AWIS D ROKET").font(.system(size: 15)).foregroundColor(.gray)
                                }
                                HStack {
                                    SettingsIcon(systemName: "bluetooth", backgroundColor: .blue)
                                    Text("Bluetooth").font(.system(size: 16))
                                    Spacer()
                                    Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(.gray)
                                }
                                HStack {
                                    SettingsIcon(systemName: "antenna.radiowaves.left.and.right", backgroundColor: .green)
                                    Text("Seluler").font(.system(size: 16))
                                    Spacer()
                                    Text("Mati").font(.system(size: 15)).foregroundColor(.gray)
                                }
                                HStack {
                                    SettingsIcon(systemName: "personalhotspot", backgroundColor: Color(red: 0.15, green: 0.75, blue: 0.4))
                                    Text("Hotspot Pribadi").font(.system(size: 16))
                                    Spacer()
                                    Text("Mati").font(.system(size: 15)).foregroundColor(.gray)
                                }
                                HStack {
                                    SettingsIcon(systemName: "battery.100", backgroundColor: .green)
                                    Text("Baterai").font(.system(size: 16))
                                }
                            }
                            
                            // Section 4: Menu Utama Sistem
                            Section {
                                NavigationLink(destination: GeneralSettingsView()) {
                                    HStack {
                                        SettingsIcon(systemName: "gear", backgroundColor: .gray)
                                        Text("Umum").font(.system(size: 16))
                                    }
                                }
                                HStack {
                                    SettingsIcon(systemName: "accessibility", backgroundColor: .blue)
                                    Text("Aksesibilitas").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "sparkles", backgroundColor: Color(red: 0.85, green: 0.35, blue: 0.2))
                                    Text("Apple Intelligence & Siri").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "magnifyingglass", backgroundColor: .gray)
                                    Text("Cari").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "camera.fill", backgroundColor: .gray)
                                    Text("Kamera").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "apps.iphone", backgroundColor: .blue)
                                    Text("Layar Utama & Perpustakaan App").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "switch.2", backgroundColor: .gray)
                                    Text("Pusat Kontrol").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "clock.badge.checkmark.fill", backgroundColor: .black)
                                    Text("Siaga").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "sun.max.fill", backgroundColor: .blue)
                                    Text("Tampilan & Kecerahan").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "arrow.right.circle.fill", backgroundColor: .blue)
                                    Text("Tombol Tindakan").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "circles.hexagongrid.fill", backgroundColor: Color(red: 0.3, green: 0.7, blue: 0.9))
                                    Text("Wallpaper").font(.system(size: 16))
                                }
                            }
                            
                            // Section 5: Pemberitahuan & Lainnya
                            Section {
                                HStack {
                                    SettingsIcon(systemName: "bell.badge.fill", backgroundColor: .red)
                                    Text("Pemberitahuan").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "speaker.wave.3.fill", backgroundColor: .pink)
                                    Text("Bunyi & Haptik").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "moon.fill", backgroundColor: .indigo)
                                    Text("Fokus").font(.system(size: 16))
                                }
                                HStack {
                                    SettingsIcon(systemName: "hourglass", backgroundColor: .indigo)
                                    Text("Durasi Layar").font(.system(size: 16))
                                }
                            }
                            
                            // Spacer bawah agar konten tidak tertutup search bar
                            Section {
                                Color.clear.frame(height: 70)
                            }
                            .listRowBackground(Color.clear)
                        }
                        .navigationTitle("Pengaturan")
                        .listStyle(.insetGrouped)
                        .scrollContentBackground(.hidden)
                        
                        // Floating Search Bar di Bagian Bawah
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .semibold))
                            
                            TextField("Cari", text: $searchText)
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                            
                            Image(systemName: "mic.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(.ultraThinMaterial)
                        .cornerRadius(25)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                        .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 3)
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

// Komponen Ikon
struct SettingsIcon: View {
    let systemName: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6.5, style: .continuous)
                .fill(backgroundColor)
                .frame(width: 29, height: 29)
            Image(systemName: systemName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.trailing, 6)
    }
}

// Menu "Umum"
struct GeneralSettingsView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: AboutSettingsView()) {
                    Text("Mengenai")
                }
                Text("Pembaruan Perangkat Lunak").foregroundColor(.primary)
                Text("Penyimpanan iPhone").foregroundColor(.primary)
            }
            Section {
                Text("AppleCare & Garansi").foregroundColor(.primary)
            }
            Section {
                Text("AirDrop & AirPlay")
                Text("AirPlay & Kontinuitas")
                Text("Gambar dalam Gambar")
                Text("Pengambilan Layar")
                Text("CarPlay")
            }
            Section {
                Text("Bahasa & Wilayah")
                Text("Font")
                Text("Isi-Auto & Kata Sandi")
                Text("Kamus")
                Text("Papan Ketik")
                Text("Segarkan App di Latar")
                Text("Tanggal & Waktu")
            }
            Section {
                Text("Penyedia TV")
            }
            Section {
                NavigationLink(destination: VPNManagementView()) {
                    Text("Manajemen VPN & Perangkat")
                }
            }
            Section {
                Text("Legal & Pengatur")
                Text("Transfer atau Atur Ulang iPhone")
            }
        }
        .navigationTitle("Umum")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

// Menu "Mengenai"
struct AboutSettingsView: View {
    var body: some View {
        List {
            Section {
                HStack { Text("Nama"); Spacer(); Text("iPhone Dimas").foregroundColor(.gray) }
                HStack { Text("Versi iOS"); Spacer(); Text("26.5").foregroundColor(.gray) }
                HStack { Text("Nama Model"); Spacer(); Text("iPhone 17 Pro Max").foregroundColor(.gray) }
                HStack { Text("Nomor Model"); Spacer(); Text("MFYP4PA/A").foregroundColor(.gray) }
                HStack { Text("Nomor Seri"); Spacer(); Text("KJX6WK6357").foregroundColor(.gray) }
            }
            
            Section {
                HStack { Text("Garansi Terbatas"); Spacer(); Text("Kedaluwarsa pada 27/12/26").foregroundColor(.gray) }
            }
            
            Section {
                HStack { Text("Lagu"); Spacer(); Text("0").foregroundColor(.gray) }
                HStack { Text("Video"); Spacer(); Text("1.029").foregroundColor(.gray) }
                HStack { Text("Foto"); Spacer(); Text("7.862").foregroundColor(.gray) }
                HStack { Text("Aplikasi"); Spacer(); Text("39").foregroundColor(.gray) }
                HStack { Text("Kapasitas"); Spacer(); Text("256 GB").foregroundColor(.gray) }
                HStack { Text("Tersedia"); Spacer(); Text("157,19 GB").foregroundColor(.gray) }
            }
            
            Section {
                HStack { Text("Alamat Wi-Fi"); Spacer(); Text("B8:01:1F:BA:90:38").foregroundColor(.gray) }
                HStack { Text("Bluetooth"); Spacer(); Text("B8:01:1F:B8:D8:67").foregroundColor(.gray) }
                HStack { Text("Firmware Modem"); Spacer(); Text("1.60.02").foregroundColor(.gray) }
                HStack { Text("SEID"); Spacer(); Text("").foregroundColor(.gray) }
                HStack { Text("EID"); Spacer(); Text("89049032020008884800234954216871").font(.system(size: 13)).foregroundColor(.gray) }
                HStack { Text("Kunci Operator"); Spacer(); Text("Tidak ada pembatasan SIM").foregroundColor(.gray) }
            }
            
            Section(header: Text("SIM Fisik")) {
                HStack { Text("Jaringan"); Spacer(); Text("INDOSATOOREDOO").foregroundColor(.gray) }
                HStack { Text("Operator"); Spacer(); Text("INDOSAT 70.0").foregroundColor(.gray) }
                HStack { Text("IMEI"); Spacer(); Text("35 260231 063492 5").foregroundColor(.gray) }
                HStack { Text("ICCID"); Spacer(); Text("89620130003168785752").font(.system(size: 13)).foregroundColor(.gray) }
            }
            
            Section(header: Text("SIM yang Tersedia")) {
                HStack { Text("IMEI2"); Spacer(); Text("35 260231 067993 8").foregroundColor(.gray) }
            }
            
            Section {
                NavigationLink(destination: CertificateTrustView()) {
                    Text("Pengaturan Kepercayaan Sertifikat")
                }
            }
        }
        .navigationTitle("Mengenai")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

// Menu "Manajemen VPN & Perangkat"
struct VPNManagementView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    SettingsIcon(systemName: "network", backgroundColor: .blue)
                    Text("VPN").font(.system(size: 16))
                    Spacer()
                    Text("Tidak Terhubung")
                        .foregroundColor(.gray)
                }
            }
            
            Section {
                Text("Masuk ke Akun Kantor atau Sekolah...")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Manajemen VPN & Perangkat")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

// Menu "Pengaturan Kepercayaan Sertifikat"
struct CertificateTrustView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Versi Stok Sertifikat")
                    Spacer()
                    Text("2026040100")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("Versi Aset Kepercayaan")
                    Spacer()
                    Text("1013")
                        .foregroundColor(.gray)
                }
            }
            
            Section {
                Button(action: {}) {
                    Text("Pelajari sertifikat terpercaya lebih lanjut")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            .listRowBackground(Color.clear)
        }
        .navigationTitle("Pengaturan Kepercayaan Sertifikat")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}
