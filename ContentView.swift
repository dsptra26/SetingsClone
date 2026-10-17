import SwiftUI

struct SettingsMainView: View {
    @State private var isAirplaneModeOn = false
    
    var body: some View {
        NavigationStack {
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
                
                // Section 2: Pembaruan iOS
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
                
                // Section 3: Konektivitas
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
                
                // Section 4: Menu Umum
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
                }
            }
            .navigationTitle("Pengaturan")
            .listStyle(.insetGrouped)
        }
    }
}

// Komponen Kotak Ikon Bersudut Melengkung (Rounded Rectangle Khas iOS)
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

// Menu Umum
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
    }
}

// Menu Mengenai
struct AboutSettingsView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Nama")
                    Spacer()
                    Text("iPhone Dimas").foregroundColor(.gray)
                }
                HStack {
                    Text("Versi iOS")
                    Spacer()
                    Text("27.0.1").foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Mengenai")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
    }
}

// Menu Manajemen VPN & Perangkat
struct VPNManagementView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("VPN")
                    Spacer()
                    Text("Tidak Terhubung").foregroundColor(.gray)
                }
            }
            Section {
                NavigationLink(destination: CertificateTrustView()) {
                    Text("Pengaturan Kepercayaan Sertifikat")
                }
            } footer: {
                Text("Percayai penuh sertifikat akar untuk sertifikat.")
            }
        }
        .navigationTitle("Manajemen VPN & Perangkat")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.insetGrouped)
    }
}

// Menu Pengaturan Kepercayaan Sertifikat
struct CertificateTrustView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Versi Stok Sertifikat")
                    Spacer()
                    Text("2026040100").foregroundColor(.gray)
                }
                HStack {
                    Text("Versi Aset Kepercayaan")
                    Spacer()
                    Text("1013").foregroundColor(.gray)
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
    }
}
