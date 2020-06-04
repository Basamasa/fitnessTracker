//
//  PopupView.swift
//  PoseNet
//
//  Created by Anzer Arkin on 03.05.20.
//  Copyright © 2020 tensorflow. All rights reserved.
//

import Foundation
import SwiftEntryKit
import AVFoundation

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

class PopupView {
    
    static func showView(text: String) {
        var attributes = EKAttributes()
        attributes.position = .bottom
        attributes.displayDuration = 6
        //        attributes.positionConstraints.verticalOffset = 0
        attributes.entryInteraction = .dismiss
        attributes.screenInteraction = .dismiss
        attributes.entryBackground = .color(color: .init(red: 0, green: 0, blue: 0))
                
        //        showNotificationMessage(attributes: attributes, title: "Nima", desc: "description", textColor: .white, imageName: "ic_fast_forward_white")
        let warningImage = "ic_error"
        switch text.prefix(2) {
        case "A1":

            let receicedText = "Elbows flaring"
            let descriptionText = "Keep your elbows slightly tucked in and your shoulder blades together"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button A1")
            }
            
        case "A2":
            let receicedText = "Sagging midsection"
            let descriptionText = "Keep hips in line with shoulders"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button A2")
            }
        case "A3":
            let receicedText = "Hands in front of shoulders, elbows in “T-shape”"
            let descriptionText = "Put your hands directly under your shoulders, elbows in “A-shape”"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button A3")
            }
        case "B1":
            let receicedText = "Hips too high"
            let descriptionText = "Keep hips in line with shoulders and heels"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button B1")
            }
        case "B2":
            let receicedText = "Hips too low"
            let descriptionText = "Keep hips in line with shoulders and heels"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button B2")
            }
        case "C1":
            let receicedText = "Pulling on your neck"
            let descriptionText = "Keep your neck straight, in line with your upper back"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button C1")
            }
        case "C2":
            let receicedText = "Leading with the chin (poking your chin out)"
            let descriptionText = "Keep your chin tucked in and your eyes facing straight ahead"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button C2")
            }
            
        case "C3":
            let receicedText = "Anchoring your feet"
            let descriptionText = "Keep your feet stable on the floor"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button C3")
            }
        case "D1":
            let receicedText = "Knees caving in"
            let descriptionText = "Keep knees in line with your toes or slightly pushed out"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button D1")
            }
        case "D2":
            let receicedText = "Bending the knees first"
            let descriptionText = "Initiate the squat by pushing your hips back"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button D2")
            }
        case "E1":
            let receicedText = "Front knee too far forward"
            let descriptionText = "Try to keep your front knee over your toes"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button E1")
            }
        case "E2":
            let receicedText = "Excessive forward lean in upper body"
            let descriptionText = "Look straight ahead and try to keep your chest up"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button E2")
            }
        case "F1":
            let receicedText = "Overarching the back"
            let descriptionText = "Try to keep your lower back in a neutral position"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button F1")
            }
        case "F2":
            let receicedText = "Foot turns inward or outward"
            let descriptionText = "Keep your foot parallel to your lower leg, even if you move your thigh to the side"
            let thirdChar = text[text.index(text.startIndex, offsetBy: 2)]

            switch thirdChar {
            case "0": // Text
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "1": // Posenet
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button F2")
            }
        case "CorrectInfo":
        showAlertView(attributes: attributes, receivedText: "Correct", descriptionText: "Perfect", ringTone: 1010, imageName: "ic_success")
        default:
            print("No a correct respond")
        }

    }
    
    static private func showAlertView(attributes: EKAttributes, receivedText: String, descriptionText: String, ringTone: Int, imageName: String) {
        let title = EKProperty.LabelContent(
            text: receivedText,
            style: .init(
                font: .boldSystemFont(ofSize: 30),
                color: .white,
                alignment: .center
                
            )
        )
        
        let description = EKProperty.LabelContent(
            text: descriptionText,
            style: .init(
                font: .boldSystemFont(ofSize: 20),
                color: .white,
                alignment: .center
                
            )
        )
        let image = EKProperty.ImageContent(
            imageName: imageName,
            size: CGSize(width: 100, height: 100),
            contentMode: .scaleAspectFit
        )
        let simpleMessage = EKSimpleMessage(
            image: image,
            title: title,
            description: description
        )
        let buttonFont = UIFont.boldSystemFont(ofSize: 16)
        let closeButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: .white
        )
        let closeButtonLabel = EKProperty.LabelContent(
            text: "NOT NOW",
            style: closeButtonLabelStyle
        )
        let closeButton = EKProperty.ButtonContent(
            label: closeButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: .white
            ) {
                SwiftEntryKit.dismiss()
        }

        let okButtonLabelStyle = EKProperty.LabelStyle(
            font: buttonFont,
            color: .white
            
        )
        let okButtonLabel = EKProperty.LabelContent(
            text: "SHOW ME",
            style: okButtonLabelStyle
        )
        let okButton = EKProperty.ButtonContent(
            label: okButtonLabel,
            backgroundColor: .clear,
            highlightedBackgroundColor: .white
            ) {
                SwiftEntryKit.dismiss()
        }
        // Generate the content
        let buttonsBarContent = EKProperty.ButtonBarContent(
            with: okButton, closeButton,
            separatorColor: .white,
            
            expandAnimatedly: true
        )
        let alertMessage = EKAlertMessage(
            simpleMessage: simpleMessage,
            buttonBarContent: buttonsBarContent
        )
        let contentView = EKAlertMessageView(with: alertMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
        
        // Sound effect
//        AudioServicesPlayAlertSound(SystemSoundID(ringTone))

        // Voice speak
        let utterance = AVSpeechUtterance(string: descriptionText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
}
