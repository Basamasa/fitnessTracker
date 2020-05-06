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
            case "1": // Photo
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "2": // Voice
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "3": // TextVoice
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            case "4": // PhotoVoice
                showAlertView(attributes: attributes, receivedText: receicedText, descriptionText: descriptionText, ringTone: 1007, imageName: warningImage)
            default:
                print("Wrong button")
            }
            
        case "A2":
            showAlertView(attributes: attributes, receivedText: "Sagging midsection", descriptionText: "Keep hips in line with shoulders", ringTone: 1007, imageName: warningImage)
        case "A3":
                showAlertView(attributes: attributes, receivedText: "Hands in front of shoulders, elbows in “T-shape”", descriptionText: "Put your hands directly under your shoulders, elbows in “A-shape”", ringTone: 1007, imageName: warningImage)
        case "B1":
                showAlertView(attributes: attributes, receivedText: "Hips too high", descriptionText: "Keep hips in line with shoulders and heels", ringTone: 1007, imageName: warningImage)
        case "B2":
                showAlertView(attributes: attributes, receivedText: "Hips too low", descriptionText: "Keep hips in line with shoulders and heels", ringTone: 1007, imageName: warningImage)
        case "C1":
                showAlertView(attributes: attributes, receivedText: "Pulling on your neck", descriptionText: "Keep your neck straight, in line with your upper back", ringTone: 1007, imageName: warningImage)
        case "C2":
                showAlertView(attributes: attributes, receivedText: "Leading with the chin (poking your chin out)", descriptionText: "Keep your chin tucked in and your eyes facing straight ahead", ringTone: 1007, imageName: warningImage)
        case "C3":
                showAlertView(attributes: attributes, receivedText: "Anchoring your feet", descriptionText: "Keep your feet stable on the floor", ringTone: 1007, imageName: warningImage)
        case "D1":
                showAlertView(attributes: attributes, receivedText: "Knees caving in", descriptionText: "Keep knees in line with your toes or slightly pushed out", ringTone: 1007, imageName: warningImage)
        case "D2":
                showAlertView(attributes: attributes, receivedText: "Bending the knees first", descriptionText: "Initiate the squat by pushing your hips back", ringTone: 1007, imageName: warningImage)
        case "E1":
                showAlertView(attributes: attributes, receivedText: "Front knee too far forward", descriptionText: "Try to keep your front knee over your toes", ringTone: 1007, imageName: warningImage)
        case "E2":
                showAlertView(attributes: attributes, receivedText: "Excessive forward lean in upper body", descriptionText: "Look straight ahead and try to keep your chest up", ringTone: 1007, imageName: warningImage)
        case "F1":
                showAlertView(attributes: attributes, receivedText: "Overarching the back", descriptionText: "Try to keep your lower back in a neutral position", ringTone: 1007, imageName: warningImage)
        case "F2":
                showAlertView(attributes: attributes, receivedText: "Foot turns inward or outward", descriptionText: "Keep your foot parallel to your lower leg, even if you move your thigh to the side", ringTone: 1007, imageName: warningImage)
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
//        AudioServicesPlayAlertSound(SystemSoundID(ringTone))

        let utterance = AVSpeechUtterance(string: descriptionText)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
}
