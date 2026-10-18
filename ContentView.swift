import SwiftUI

// Path Vektor Presisi untuk Logo Bluetooth iOS
struct BluetoothShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        path.move(to: CGPoint(x: w * 0.35, y: h * 0.25))
        path.addLine(to: CGPoint(x: w * 0.65, y: h * 0.5))
        path.addLine(to: CGPoint(x: w * 0.5, y: h * 0.15))
        path.addLine(to: CGPoint(x: w * 0.5, y: h * 0.85))
        path.addLine(to: CGPoint(x: w * 0.65, y: h * 0.5))
        path.addLine(to: CGPoint(x: w * 0.35, y: h * 0.75))
        
        return path
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
                                    colors: [Color(red: 0.35, green: 0.65, blue: 0.75), Color(red: 0.15, green: 0.35, blue: 0.45)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .frame(width: 58, height: 58)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Dimas Saputra")
                                    .font(.system(size: 19, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Akun Apple, iCloud, dan lainnya")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                        }
                        .padding(.vertical, 2)
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
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                        }
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
                        
                        NavigationLink(destination: Text("Wi-Fi")) {
                            HStack {
                                SettingsIcon(systemName: "wifi", backgroundColor: .blue)
                                Text("Wi-Fi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("AWIS D ROKET").font(.system(size: 15)).foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: Text("Bluetooth")) {
                            HStack {
                                CustomBluetoothIcon()
                                Text("Bluetooth").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Tidak Terhubung").font(.system(size: 15)).foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: Text("Seluler")) {
                            HStack {
                                SettingsIcon(systemName: "antenna.radiowaves.left.and.right", backgroundColor: .green)
                                Text("Seluler").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                            }
                        }
                        
                        NavigationLink(destination: Text("Hotspot")) {
                            HStack {
                                SettingsIcon(systemName: "personalhotspot", backgroundColor: Color(red: 0.2, green: 0.78, blue: 0.35))
                                Text("Hotspot Pribadi").font(.system(size: 16)).foregroundColor(.white)
                                Spacer()
                                Text("Mati").font(.system(size: 15)).foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: Text("Baterai")) {
                            HStack {
                                SettingsIcon(systemName: "battery.100", backgroundColor: .green)
                                Text("Baterai").font(.system(size: 16)).foregroundColor(.white)
                            }
                        }
                    }
                    
                    // Section 4: Menu Utama Sistem
                    Section {
                        NavigationLink(destination: GeneralSettingsView()) {
                            HStack {
                                SettingsIcon(systemName: "gear", backgroundColor: .gray)
                                Text("Umum").font(.system(size: 16)).foregroundColor(.white)
                            }
                        }
                        NavigationLink(destination: Text("Aksesibilitas")) {
                            HStack {
                                SettingsIcon(systemName: "accessibility", backgroundColor: .blue)
                                Text("Aksesibilitas").font(.system(size: 16)).foregroundColor(.white)
                            }
                        }
                        NavigationLink(destination: Text("Siri")) {
                            HStack {
                                SettingsIcon(systemName: "sparkles", backgroundColor: Color(red: 0.9, green: 0.35, blue: 0.2))
                                Text("Apple Intelligence & Siri").font(.system(size: 16)).foregroundColor(.white)
                            }
                        }
                    }
                    
                    Section {
                        Color.clear.frame(height: 60)
                    }
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("Pengaturan")
                .listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                
                // Floating Search Bar Bottom
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
                .padding(.vertical, 10)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
        }
    }
}

// Komponen Ikon Bluetooth Kustom
struct CustomBluetoothIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6.5, style: .continuous)
                .fill(Color.blue)
                .frame(width: 29, height: 29)
            
            BluetoothShape()
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .frame(width: 12, height: 16)
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
                NavigationLink(destination: VPNManagementView()) {
                    Text("Manajemen VPN & Perangkat")
                }
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

// Menu "VPN"
struct VPNManagementView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    SettingsIcon(systemName: "network", backgroundColor: .blue)
                    Text("VPN").font(.system(size: 16))
                    Spacer()
                    Text("Tidak Terhubung").foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Manajemen VPN & Perangkat")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

// Menu "Certificate"
struct CertificateTrustView: View {
    var body: some View {
        List {
            Section {
                HStack { Text("Versi Stok Sertifikat"); Spacer(); Text("2026040100").foregroundColor(.gray) }
                HStack { Text("Versi Aset Kepercayaan"); Spacer(); Text("1013").foregroundColor(.gray) }
            }
        }
        .navigationTitle("Pengaturan Kepercayaan Sertifikat")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}
