//
//  AudioPlayer.swift
//  Restart
//
//  Created by Breno Henrique on 13/05/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String)
{
    if let path = Bundle.main.path(forResource: sound, ofType: type)
    {
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        
        catch
        {
            print("Não foi possível reproduzir o áudio.")
        }
    }
}
