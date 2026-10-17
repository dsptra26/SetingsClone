import SwiftUI

struct SettingsMainView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 15) {
                        Circle()
                            .fill(Color.teal.gradient)
                            .frame(width: 60, height: 60)
                            .overlay(Text("DS").foregroundColor(.white).bold())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Dimas Saputra")
                                .font(.headline)
                            Text("Akun Apple, iCloud, dan lainnya")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
                
                Section {
                    HStack {
                        Text("Perbarui ke iOS 27.0.1")
                        Spacer()
                        Text("1")
                            .font(.caption)
                            .padding(6)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                
                Section {
                    HStack {
                        Label("Mode Pesawat", systemImage: "airplane")
                        Spacer()
                    }
                    HStack {
                        Label("Wi-Fi", systemImage: "wifi")
                        Spacer()
                        Text("AWIS D ROKET").foregroundColor(.gray)
                    }
                    HStack {
                        Label("Bluetooth", systemImage: "bluetooth")
                        Spacer()
                        Text("Tidak Terhubung").foregroundColor(.gray)
                    }
                    HStack {
                        Label("Seluler", systemImage: "antenna.radiowaves.left.and.right")
                        Spacer()
                        Text("Mati").foregroundColor(.gray)
                    }
                    HStack {
                        Label("Hotspot Pribadi", systemImage: "personalhotspot")
                        Spacer()
                        Text("Mati").foregroundColor(.gray)
                    }
                    Label("Baterai", systemImage: "battery.100")
                }
                
                Section {
                    NavigationLink(destination: GeneralSettingsView()) {
                        Label("Umum", systemImage: "gear")
                    }
                    Label("Aksesibilitas", systemImage: "accessibility")
                    Label("Apple Intelligence & Siri", systemImage: "sparkles")
                }
            }
            .navigationTitle("Pengaturan")
            .listStyle(.insetGrouped)
        }
    }
}

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
