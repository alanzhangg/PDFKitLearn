//
//  ViewController.swift
//  PDFDemo
//
//  Created by zhangalan on 2019/3/12.
//  Copyright © 2019 zhangalan. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController, PDFDocumentDelegate {

  @IBOutlet var PdfView: PDFView!
  
  func insertFormFieldsInto(_ page: PDFPage) {
    
    let pageBox = page.bounds(for: .cropBox)
    let textFieldNameBounds = CGRect(x: 169.0, y: pageBox.size.height - 102, width: 371, height: 23)
    let textFieldName = PDFAnnotation(bounds: textFieldNameBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    textFieldName.widgetFieldType = PDFAnnotationWidgetSubtype.init(rawValue: PDFAnnotationWidgetSubtype.text.rawValue)
    textFieldName.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
    textFieldName.font = UIFont.systemFont(ofSize: 18)
    page.addAnnotation(textFieldName)
    
    let textFieldDateBounds = CGRect(x: 283, y: pageBox.size.height - 135, width: 257, height: 22)
    let textFueldDate = PDFAnnotation(bounds: textFieldDateBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    textFueldDate.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.text.rawValue)
    textFueldDate.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
    textFueldDate.font = UIFont.systemFont(ofSize: 18)
    textFueldDate.maximumLength = 5
    textFueldDate.hasComb = true
    page.addAnnotation(textFueldDate)
  }
  
  func insertRadioButtonInto(_ page: PDFPage) {
    let pageBound = page.bounds(for: .cropBox)
    
    let radioButtonYesBounds = CGRect(x: 135, y: pageBound.size.height - 249, width: 24, height: 24)
    let radioButtonYes = PDFAnnotation(bounds: radioButtonYesBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    radioButtonYes.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.button.rawValue)
    radioButtonYes.widgetControlType = .radioButtonControl
    radioButtonYes.fieldName = "Radio Button"
    radioButtonYes.buttonWidgetStateString = "Yes"
    page.addAnnotation(radioButtonYes)
    
    let radioButtonNoBounds = CGRect(x: 210, y: pageBound.size.height - 249, width: 24, height: 24)
    let radioButtonNo = PDFAnnotation(bounds: radioButtonNoBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    radioButtonNo.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.button.rawValue)
    radioButtonNo.widgetControlType = .radioButtonControl
    radioButtonNo.fieldName = "Radio Button"
    radioButtonNo.buttonWidgetStateString = "No"
    page.addAnnotation(radioButtonNo)
  }
  
  func insertCheckboxInto(_ page: PDFPage) {
    let pageBounds = page.bounds(for: .cropBox)
    
    let checkboxLoremBounds = CGRect(x: 255, y: pageBounds.size.height - 370, width: 24, height: 24)
    let checkboxLorem = PDFAnnotation(bounds: checkboxLoremBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    checkboxLorem.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.button.rawValue)
    checkboxLorem.widgetControlType = .checkBoxControl
    page.addAnnotation(checkboxLorem)
    
    let checkboxIpsumFestivalBounds = CGRect(x: 255, y: pageBounds.size.height - 417, width: 24, height: 24)
    let checkboxIpsumFestival = PDFAnnotation(bounds: checkboxIpsumFestivalBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    checkboxIpsumFestival.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.button.rawValue)
    checkboxIpsumFestival.widgetControlType = .checkBoxControl
    page.addAnnotation(checkboxIpsumFestival)
    
    let checkboxDolorFestivalBounds = CGRect(x: 255, y: pageBounds.size.height - 464, width: 24, height: 24)
    let checkboxDolorFestival = PDFAnnotation(bounds: checkboxDolorFestivalBounds, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    checkboxDolorFestival.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.button.rawValue)
    checkboxDolorFestival.widgetControlType = .checkBoxControl
    page.addAnnotation(checkboxDolorFestival)
    
  }
  
  func insertResetButtonInto(_ page: PDFPage) {
    let pageBounds = page.bounds(for: .cropBox)
    
    let resetButtonBound = CGRect(x: 90, y: pageBounds.size.height - 680, width: 106, height: 32)
    let resetButton = PDFAnnotation(bounds: resetButtonBound, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    resetButton.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.button.rawValue)
    resetButton.widgetControlType = .pushButtonControl
    resetButton.caption = "Reset"
    page.addAnnotation(resetButton)

    let resetFormAction = PDFActionResetForm()
    resetFormAction.fieldsIncludedAreCleared = false
    resetButton.action = resetFormAction
  }
  
  func insertMultilineTextBoxInto(_ page: PDFPage) {
    let pageBounds = page.bounds(for: .cropBox)
    
    let textFieldMultiTextBound =  CGRect(x: 90, y: pageBounds.size.height - 632, width: 276, height: 80)
    let textFieldMultilineText = PDFAnnotation(bounds: textFieldMultiTextBound, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    textFieldMultilineText.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.text.rawValue)
    textFieldMultilineText.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
    textFieldMultilineText.font = UIFont.systemFont(ofSize: 24)
    textFieldMultilineText.isMultiline = true
    page.addAnnotation(textFieldMultilineText)
  }
  
  func insertSignatureInto(_ page: PDFPage) {
    let pageBounds = page.bounds(for: .cropBox)
    let signatureBound = CGRect(x: 370, y: pageBounds.size.height - 680, width: 200, height: 150)
    let signature = PDFAnnotation(bounds: signatureBound, forType: PDFAnnotationSubtype(rawValue: PDFAnnotationSubtype.widget.rawValue), withProperties: nil)
    signature.widgetFieldType = PDFAnnotationWidgetSubtype(rawValue: PDFAnnotationWidgetSubtype.signature.rawValue)
    signature.backgroundColor = UIColor.blue.withAlphaComponent(0.25)
    page.addAnnotation(signature)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let documentURL = Bundle.main.url(forResource: "MyForm", withExtension: "pdf"),
      let document = PDFDocument(url: documentURL){
      document.delegate = self
      PdfView.document = document
      PdfView.autoScales = true
      PdfView.backgroundColor = UIColor.lightGray
      if let page = document.page(at: 0){
        insertFormFieldsInto(page)
        insertRadioButtonInto(page)
        insertCheckboxInto(page)
        insertResetButtonInto(page)
        insertMultilineTextBoxInto(page)
        insertSignatureInto(page)
      }
    }
  }

  func classForPage() -> AnyClass {
    return WatermarkPage.self
  }

}

