import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class PdfPage extends StatefulWidget {
  //final int numeroPdf;
  const PdfPage({
    Key? key,
    // required this.numeroPdf,
  }) : super(key: key);

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  static const int _initialPage = 2;

  bool isSampleDoc = true;
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    //  bookModel.getBookNumber();
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf_01.pdf'),
      //document: PdfDocument.openAsset('assets/pdf_0${widget.numeroPdf}.pdf'),
      // document:
      //     PdfDocument.openAsset('assets/pdf_0${bookModel.getBookNumber()}.pdf'),
      //document: PdfDocument.openAsset('assets/pdf_0$bookIndex.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      documentLoader: const Center(child: CircularProgressIndicator()),
      pageLoader: const Center(child: CircularProgressIndicator()),
      controller: _pdfController,
    );
  }
}
