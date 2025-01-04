//
//  ContentView.swift
//  Kultura
//
//  Created by Tural Babayev on 9.12.2024.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some View {
        RestaurantMapView()
        /*
        appCoordinator.start()
            .onReceive(appCoordinator.$currentView) { newView in
                // Ekranı güncellemek için dinamik olarak izleme
            }
         */
    }
}

/*
import SwiftUI
import Speech
import AVFoundation

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var recognizedText: String = "" // Algılanan metin
    @State private var isListening: Bool = false // Dinleme durumu
    @State private var tabooWord: String = "" // Algılanan tabu kelime

    // Alert durumunu gözlemlemek için bir Binding kullanıyoruz
    @State private var showAlert: Bool = false {
        didSet {
            if showAlert {
                playTabooSound() // Alert açıldığında ses çal
            }
        }
    }

    // Tabu kelimeler listesi
    let tabooWords = ["motor", "araba", "yol"]

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Tabu Test Uygulaması")
                    .font(.title)
                    .padding()

                Text("Tanımlanan Kelime:")
                    .font(.headline)
                Text(recognizedText)
                    .font(.body)
                    .foregroundColor(tabooWords.contains(where: recognizedText.lowercased().contains) ? .red : .green)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                // Başlat/Durdur Butonu
                Button(action: {
                    if isListening {
                        speechRecognizer.stopListening()
                    } else {
                        speechRecognizer.startListening { result in
                            self.recognizedText = result
                            if let taboo = self.tabooWords.first(where: result.lowercased().contains) {
                                self.tabooWord = taboo
                                self.showAlert = true // Alert açılır ve ses tetiklenir
                                self.speechRecognizer.stopListening() // Dinleme durdurulur
                                self.isListening = false
                            }
                        }
                    }
                    isListening.toggle()
                }) {
                    Text(isListening ? "Durdur" : "Başlat")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isListening ? Color.red : Color.blue)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .padding()

            // Tabu Alert Ekranı
            if showAlert {
                VStack {
                    Text("Tabu Oldunuz!")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .padding()
                    Text("Tabu kelime: \(tabooWord)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(8)

                    Button(action: {
                        self.showAlert = false
                    }) {
                        Text("Tamam")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.7))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }

    // Tabu sesini oynatır
    func playTabooSound() {
        do {
            // Ses kategorisini ayarla
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
            
            // Sistem sesi çal
            AudioServicesPlaySystemSound(1057) // Klavye doğrulama sesi
            print("Sistem sesi çalınıyor.")
        } catch {
            print("Ses yönlendirme hatası: \(error.localizedDescription)")
        }
    }
}

class SpeechRecognizer: ObservableObject {
    private var speechRecognizer: SFSpeechRecognizer?
    private var audioEngine: AVAudioEngine?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    init() {
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "tr-TR")) // Türkçe dil desteği
    }

    func startListening(completion: @escaping (String) -> Void) {
        guard let speechRecognizer = speechRecognizer, speechRecognizer.isAvailable else {
            print("Speech recognizer not available.")
            return
        }

        audioEngine = AVAudioEngine()
        request = SFSpeechAudioBufferRecognitionRequest()

        guard let audioEngine = audioEngine, let request = request else { return }

        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            request.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine couldn't start: \(error.localizedDescription)")
            return
        }

        recognitionTask = speechRecognizer.recognitionTask(with: request) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    completion(result.bestTranscription.formattedString)
                }
            }
            if error != nil {
                audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionTask = nil
                self.request = nil
                self.audioEngine = nil
            }
        }
    }

    func stopListening() {
        audioEngine?.stop()
        audioEngine?.inputNode.removeTap(onBus: 0)
        recognitionTask?.cancel()
        request = nil
        audioEngine = nil
    }
}

*/
