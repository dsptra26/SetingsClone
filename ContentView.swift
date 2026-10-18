import SwiftUI

// Shapes Vektor Logo Bluetooth Presisi Sisi Asli iOS
struct OfficialBluetoothLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.32, y: h * 0.26))
        path.addLine(to: CGPoint(x: w * 0.68, y: h * 0.52))
        path.addLine(to: CGPoint(x: w * 0.50, y: h * 0.14))
        path.addLine(to: CGPoint(x: w * 0.50, y: h * 0.86))
        path.addLine(to: CGPoint(x: w * 0.68, y: h * 0.48))
        path.addLine(to: CGPoint(x: w * 0.32, y: h * 0.74))
        
        return path
    }
}

// Tombol Back Lingkaran Bundar Khas iOS Modern
struct CircleBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            ZStack {
                Circle()
                    .fill(Color(white: 0.2))
                    .frame(width: 30, height: 30)
                Image(systemName: "chevron.left")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

struct SettingsMainView: View {
    @State private var isAirplaneModeOn = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color.black
                    .ignoresSafeArea(.all)
                
                List {
                    // Section 1: Profil Akun Apple
                    Section {
                        HStack(spacing: 15) {
                            Circle()
                                .fill(LinearGradient(
                                    colors: [Color(red: 0.28, green: 0.60, blue: 0.70), Color(red: 0.12, green: 0.28, blue: 0.38)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Dimas Saputra")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Akun Apple, iCloud, dan lainnya")
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                        }
                        .padding(.vertical, 4)
                    }
                    
                    // Section 2: Banner Perbarui iOS
                    Section {
                        HStack {
                            Text("Perbarui ke iOS 27.0.1")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 20, height: 20)
                                Text("1")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                        }
                        .padding(.vertical, 2)
                    }
                    
                    // Section 3: Konektivitas & Baterai
                    Section {
                        HStack {
                            SettingsIcon(systemName: "airplane", backgroundColor: .orange)
                            Text("Mode Pesawat").font(.system(size: 16)).foregroundColor(.white)
                            Spacer()
                            Toggle("", isOn: $isAirplaneModeOn)
                                .labelsHidden()
                        }
                        .padding(.vertical, 3)
                        
                        NavigationLink(destination: Text("Wi-Fi")) {
                            HStack {
                                SettingsIcon(systemName: "wifi", backgroundColor: .blue)
                                Text("Wi-Fi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("AWIS D ROKET").font(.system(size: 15)).foregroundColor(.gray)
                            }
                            .padding(.vertical, 3)
                        }
                        
                        NavigationLink(destination: Text("Bluetooth")) {
                            HStack {
                                CustomBluetoothIcon()
                                Text("Bluetooth").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(.gray)
                            }
                            .padding(.vertical, 3)
                        }
                        
                        NavigationLink(destination: Text("Seluler")) {
                            HStack {
                                SettingsIcon(systemName: "antenna.radiowaves.left.and.right", backgroundColor: .green)
                                Text("Seluler").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(.gray)
                            }
                            .padding(.vertical, 3)
                        }
                        
                        NavigationLink(destination: Text("Hotspot")) {
                            HStack {
                                SettingsIcon(systemName: "personalhotspot", backgroundColor: Color(red: 0.18, green: 0.78, blue: 0.35))
                                Text("Hotspot Pribadi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(.gray)
                            }
                            .padding(.vertical, 3)
                        }
                        
                        NavigationLink(destination: Text("Baterai")) {
                            HStack {
                                SettingsIcon(systemName: "battery.100", backgroundColor: .green)
                                Text("Baterai").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                    }
                    
                    // Section 4: Menu Utama Sistem
                    Section {
                        NavigationLink(destination: GeneralSettingsView()) {
                            HStack {
                                SettingsIcon(systemName: "gear", backgroundColor: .gray)
                                Text("Umum").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Aksesibilitas")) {
                            HStack {
                                SettingsIcon(systemName: "accessibility", backgroundColor: .blue)
                                Text("Aksesibilitas").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Siri")) {
                            HStack {
                                SettingsIcon(systemName: "sparkles", backgroundColor: Color(red: 0.92, green: 0.35, blue: 0.18))
                                Text("Apple Intelligence & Siri").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Cari")) {
                            HStack {
                                SettingsIcon(systemName: "magnifyingglass", backgroundColor: .gray)
                                Text("Cari").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Kamera")) {
                            HStack {
                                SettingsIcon(systemName: "camera.fill", backgroundColor: .gray)
                                Text("Kamera").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Layar Utama")) {
                            HStack {
                                SettingsIcon(systemName: "apps.iphone", backgroundColor: .blue)
                                Text("Layar Utama & Perpustakaan App").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Pusat Kontrol")) {
                            HStack {
                                SettingsIcon(systemName: "switch.2", backgroundColor: .gray)
                                Text("Pusat Kontrol").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Siaga")) {
                            HStack {
                                SettingsIcon(systemName: "clock.badge.checkmark.fill", backgroundColor: .black)
                                Text("Siaga").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Tampilan")) {
                            HStack {
                                SettingsIcon(systemName: "sun.max.fill", backgroundColor: .blue)
                                Text("Tampilan & Kecerahan").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Tombol Tindakan")) {
                            HStack {
                                SettingsIcon(systemName: "arrow.right.circle.fill", backgroundColor: .blue)
                                Text("Tombol Tindakan").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Wallpaper")) {
                            HStack {
                                SettingsIcon(systemName: "circles.hexagongrid.fill", backgroundColor: Color(red: 0.3, green: 0.7, blue: 0.9))
                                Text("Wallpaper").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                    }
                    
                    // Section 5: Pemberitahuan & Lainnya
                    Section {
                        NavigationLink(destination: Text("Pemberitahuan")) {
                            HStack {
                                SettingsIcon(systemName: "bell.badge.fill", backgroundColor: .red)
                                Text("Pemberitahuan").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Bunyi & Haptik")) {
                            HStack {
                                SettingsIcon(systemName: "speaker.wave.3.fill", backgroundColor: Color(red: 0.95, green: 0.25, blue: 0.45))
                                Text("Bunyi & Haptik").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Fokus")) {
                            HStack {
                                SettingsIcon(systemName: "moon.fill", backgroundColor: .indigo)
                                Text("Fokus").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                        NavigationLink(destination: Text("Durasi Layar")) {
                            HStack {
                                SettingsIcon(systemName: "hourglass", backgroundColor: .indigo)
                                Text("Durasi Layar").font(.system(size: 16)).foregroundColor(.white)
                            }
                            .padding(.vertical, 3)
                        }
                    }
                    
                    Section {
                        Color.clear.frame(height: 65)
                    }
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("Pengaturan")
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                
                // Floating Search Bar Bottom - Super Halus & Proporsional
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white.opacity(0.45))
                        .font(.system(size: 15, weight: .semibold))
                    
                    TextField("Cari", text: $searchText)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Image(systemName: "mic.fill")
                        .foregroundColor(Color.white.opacity(0.45))
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 11)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color(white: 0.18, opacity: 0.65))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 6)
            }
        }
    }
}

// Komponen Ikon Bluetooth Proporsional
struct CustomBluetoothIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .fill(Color(red: 0.0, green: 0.48, blue: 1.0))
                .frame(width: 29, height: 29)
            
            OfficialBluetoothLogo()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2.4, lineCap: .round, lineJoin: .round))
                .frame(width: 12, height: 17)
        }
        .padding(.trailing, 6)
    }
}

// Komponen Ikon Standar
struct SettingsIcon: View {
    let systemName: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
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
                    Text("Mengenai").foregroundColor(.white)
                }
                .padding(.vertical, 3)
                Text("Pembaruan Perangkat Lunak").foregroundColor(.white)
                    .padding(.vertical, 3)
                Text("Penyimpanan iPhone").foregroundColor(.white)
                    .padding(.vertical, 3)
            }
            Section {
                Text("AppleCare & Garansi").foregroundColor(.white)
                    .padding(.vertical, 3)
            }
            Section {
                Text("AirDrop & AirPlay").foregroundColor(.white).padding(.vertical, 3)
                Text("AirPlay & Kontinuitas").foregroundColor(.white).padding(.vertical, 3)
                Text("Gambar dalam Gambar").foregroundColor(.white).padding(.vertical, 3)
                Text("Pengambilan Layar").foregroundColor(.white).padding(.vertical, 3)
                Text("CarPlay").foregroundColor(.white).padding(.vertical, 3)
            }
            Section {
                Text("Bahasa & Wilayah").foregroundColor(.white).padding(.vertical, 3)
                Text("Font").foregroundColor(.white).padding(.vertical, 3)
                Text("Isi-Auto & Kata Sandi").foregroundColor(.white).padding(.vertical, 3)
                Text("Kamus").foregroundColor(.white).padding(.vertical, 3)
                Text("Papan Ketik").foregroundColor(.white).padding(.vertical, 3)
                Text("Segarkan App di Latar").foregroundColor(.white).padding(.vertical, 3)
                Text("Tanggal & Waktu").foregroundColor(.white).padding(.vertical, 3)
            }
            Section {
                Text("Penyedia TV").foregroundColor(.white).padding(.vertical, 3)
            }
            Section {
                NavigationLink(destination: VPNManagementView()) {
                    Text("Manajemen VPN & Perangkat").foregroundColor(.white)
                }
                .padding(.vertical, 3)
            }
            Section {
                Text("Legal & Pengatur").foregroundColor(.white).padding(.vertical, 3)
                Text("Transfer atau Atur Ulang iPhone").foregroundColor(.white).padding(.vertical, 3)
            }
        }
        .navigationTitle("Umum")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
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
                HStack { Text("Nama"); Spacer(); Text("iPhone Dimas").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Versi iOS"); Spacer(); Text("26.5").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Nama Model"); Spacer(); Text("iPhone 17 Pro Max").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Nomor Model"); Spacer(); Text("MFYP4PA/A").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Nomor Seri"); Spacer(); Text("KJX6WK6357").foregroundColor(.gray) }.padding(.vertical, 3)
            }
            
            Section {
                HStack { Text("Garansi Terbatas"); Spacer(); Text("Kedaluwarsa pada 27/12/26").foregroundColor(.gray) }.padding(.vertical, 3)
            }
            
            Section {
                HStack { Text("Lagu"); Spacer(); Text("0").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Video"); Spacer(); Text("1.029").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Foto"); Spacer(); Text("7.862").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Aplikasi"); Spacer(); Text("39").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Kapasitas"); Spacer(); Text("256 GB").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Tersedia"); Spacer(); Text("157,19 GB").foregroundColor(.gray) }.padding(.vertical, 3)
            }
            
            Section {
                HStack { Text("Alamat Wi-Fi"); Spacer(); Text("B8:01:1F:BA:90:38").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Bluetooth"); Spacer(); Text("B8:01:1F:B8:D8:67").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Firmware Modem"); Spacer(); Text("1.60.02").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("SEID"); Spacer(); Text("").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("EID"); Spacer(); Text("89049032020008884800234954216871").font(.system(size: 13)).foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Kunci Operator"); Spacer(); Text("Tidak ada pembatasan SIM").foregroundColor(.gray) }.padding(.vertical, 3)
            }
            
            Section(header: Text("SIM Fisik")) {
                HStack { Text("Jaringan"); Spacer(); Text("INDOSATOOREDOO").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("Operator"); Spacer(); Text("INDOSAT 70.0").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("IMEI"); Spacer(); Text("35 260231 063492 5").foregroundColor(.gray) }.padding(.vertical, 3)
                HStack { Text("ICCID"); Spacer(); Text("89620130003168785752").font(.system(size: 13)).foregroundColor(.gray) }.padding(.vertical, 3)
            }
            
            Section(header: Text("SIM yang Tersedia")) {
                HStack { Text("IMEI2"); Spacer(); Text("35 260231 067993 8").foregroundColor(.gray) }.padding(.vertical, 3)
            }
            
            Section {
                NavigationLink(destination: CertificateTrustView()) {
                    Text("Pengaturan Kepercayaan Sertifikat").foregroundColor(.white)
                }
                .padding(.vertical, 3)
            }
        }
        .navigationTitle("Mengenai")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
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
                NavigationLink(destination: Text("VPN")) {
                    HStack {
                        SettingsIcon(systemName: "network", backgroundColor: .blue)
                        Text("VPN").font(.system(size: 16)).foregroundColor(.white)
                        Spacer()
                        Text("Tidak Terhubung").foregroundColor(.gray)
                    }
                    .padding(.vertical, 3)
                }
            }
            
            Section {
                Button(action: {}) {
                    Text("Masuk ke Akun Kantor atau Sekolah...")
                        .font(.system(size: 15))
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 3)
            }
        }
        .navigationTitle("Manajemen VPN & Perangkat")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

// Menu "Pengaturan Kepercayaan Sertifikat"
struct CertificateTrustView: View {
    var body: some View {
        List {
            Section(footer: 
                Button(action: {}) {
                    Text("Pelajari sertifikat terpercaya lebih lanjut")
                        .font(.system(size: 13))
                        .foregroundColor(.blue)
                }
                .padding(.top, 4)
            ) {
                HStack {
                    Text("Versi Stok Sertifikat").foregroundColor(.white)
                    Spacer()
                    Text("2026040100").foregroundColor(.gray)
                }
                .padding(.vertical, 3)
                
                HStack {
                    Text("Versi Aset Kepercayaan").foregroundColor(.white)
                    Spacer()
                    Text("1013").foregroundColor(.gray)
                }
                .padding(.vertical, 3)
            }
        }
        .navigationTitle("Pengaturan Kepercayaan Sertifikat")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleBackButton()
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}
