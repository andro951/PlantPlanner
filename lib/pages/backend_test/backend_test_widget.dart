import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'backend_test_model.dart';
export 'backend_test_model.dart';

class BackendTestWidget extends StatefulWidget {
  const BackendTestWidget({super.key});

  @override
  State<BackendTestWidget> createState() => _BackendTestWidgetState();
}

class _BackendTestWidgetState extends State<BackendTestWidget> {
  late BackendTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackendTestModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'backendTest'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    _model.uploadedFileUrl,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  GetPlantURLCall.bestMatch(
                    (_model.apiResultmei?.jsonBody ?? ''),
                  ),
                  'bestMatch',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Itim',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Itim',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Hello World',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Itim',
                      letterSpacing: 0.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BACKEND_TEST_PAGE_BUTTON_BTN_ON_TAP');
                  logFirebaseEvent('Button_upload_media_to_firebase');
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    allowPhoto: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    safeSetState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      safeSetState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      safeSetState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }

                  logFirebaseEvent('Button_backend_call');
                  _model.apiResultmei = await GetPlantURLCall.call(
                    imageURL: _model.uploadedFileUrl,
                  );

                  safeSetState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('BACKEND_TEST_PAGE_BUTTON_BTN_ON_TAP');
                  logFirebaseEvent('Button_backend_call');
                  _model.apiResultmmg = await PlantIdentificationCall.call();

                  safeSetState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  GetPlantURLCall.imageO(
                    (_model.apiResultmei?.jsonBody ?? ''),
                  )!
                      .first,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.jpeg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/410/600',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.jpeg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/68/600',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.jpeg',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
