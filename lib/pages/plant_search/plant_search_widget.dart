import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/dropdown_menu_widget.dart';
import '/components/similar_images_plant_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'plant_search_model.dart';
export 'plant_search_model.dart';

class PlantSearchWidget extends StatefulWidget {
  const PlantSearchWidget({
    super.key,
    bool? addPlantMode,
  }) : addPlantMode = addPlantMode ?? false;

  final bool addPlantMode;

  @override
  State<PlantSearchWidget> createState() => _PlantSearchWidgetState();
}

class _PlantSearchWidgetState extends State<PlantSearchWidget> {
  late PlantSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlantSearchModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PlantSearch'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLANT_SEARCH_PlantSearch_ON_INIT_STATE');
      logFirebaseEvent('PlantSearch_set_form_field');
      safeSetState(() {
        _model.dropdownMenuModel.dropDownValueController?.value =
            'Plant Search';
      });
    });

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    _model.imageURLTextController ??= TextEditingController();
    _model.imageURLFocusNode ??= FocusNode();

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!widget.addPlantMode)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.dropdownMenuModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const DropdownMenuWidget(
                              myPage: 'Plant Search',
                            ),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            key: const ValueKey('SearchBar_nvwl'),
                            controller: _model.searchBarTextController,
                            focusNode: _model.searchBarFocusNode,
                            onFieldSubmitted: (_) async {
                              logFirebaseEvent(
                                  'PLANT_SEARCH_SearchBar_ON_TEXTFIELD_SUBM');
                              logFirebaseEvent('SearchBar_action_block');
                              await _model.resetPlants(context);
                              safeSetState(() {});
                              logFirebaseEvent('SearchBar_action_block');
                              await _model.searchForPlants(context);
                              safeSetState(() {});
                            },
                            autofocus: true,
                            textInputAction: TextInputAction.search,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Search Plants',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).borderColor,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Itim',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.searchBarTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= 'Name',
                          ),
                          options: const ['Name', 'Type', 'Family', 'ScientificName'],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            logFirebaseEvent(
                                'PLANT_SEARCH_DropDown_vo1yk05i_ON_FORM_W');
                            logFirebaseEvent('DropDown_action_block');
                            await _model.resetPlants(context);
                            safeSetState(() {});
                            logFirebaseEvent('DropDown_action_block');
                            await _model.searchForPlants(context);
                            safeSetState(() {});
                          },
                          width: 140.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Itim',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Opacity(
                          opacity: valueOrDefault<double>(
                            _model.showCameraWidgets ? 0.8 : 1.0,
                            1.0,
                          ),
                          child: FlutterFlowIconButton(
                            key: const ValueKey('IconButton_esn9'),
                            borderRadius: 8.0,
                            buttonSize: 50.0,
                            fillColor: const Color(0xFFB1D7BE),
                            icon: Icon(
                              Icons.camera_alt,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PLANT_SEARCH_PAGE_camera_alt_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_update_page_state');
                              _model.showCameraWidgets =
                                  !_model.showCameraWidgets;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ].divide(const SizedBox(width: 4.0)),
                    ),
                    if (_model.showCameraWidgets)
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFCDECCD),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).borderColor,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF96CB96),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).borderColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Opacity(
                                      opacity: valueOrDefault<double>(
                                        _model.fromImage ? 0.8 : 1.0,
                                        1.0,
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'PLANT_SEARCH_PAGE_FROM_IMAGE_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.fromImage = true;
                                          safeSetState(() {});
                                        },
                                        text: 'From Image',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryButtonColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: valueOrDefault<double>(
                                        !_model.fromImage ? 0.8 : 1.0,
                                        1.0,
                                      ),
                                      child: FFButtonWidget(
                                        key: const ValueKey('Button_lohe'),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'PLANT_SEARCH_FROM_IMAGE_U_R_L_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.fromImage = false;
                                          safeSetState(() {});
                                        },
                                        text: 'From Image URL',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryButtonColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!_model.fromImage)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          width: 160.0,
                                          child: TextFormField(
                                            key: const ValueKey('ImageURL_a4rt'),
                                            controller:
                                                _model.imageURLTextController,
                                            focusNode: _model.imageURLFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Image URL',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Itim',
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .imageURLTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          key: const ValueKey('Button_f8eq'),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'PLANT_SEARCH_PAGE_GET_NAME_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.plantURL = _model
                                                .imageURLTextController.text;
                                            _model.recognizedPlantName = ' ';
                                            _model.recognizedPlantScientificName =
                                                ' ';
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.recognizedPlantAPIResult =
                                                await GetPlantURLCall.call(
                                              imageURL: _model
                                                  .imageURLTextController.text,
                                            );

                                            if ((_model.recognizedPlantAPIResult
                                                    ?.succeeded ??
                                                true)) {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.recognizedPlantName =
                                                  GetPlantURLCall.commonNames(
                                                (_model.recognizedPlantAPIResult
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                      .firstOrNull!;
                                              _model.recognizedPlantScientificName =
                                                  GetPlantURLCall.bestMatch(
                                                (_model.recognizedPlantAPIResult
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Plant not recognized',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.recognizedPlantName =
                                                  'not recognized';
                                              _model.recognizedPlantScientificName =
                                                  '';
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Get name',
                                          options: FFButtonOptions(
                                            width: 100.0,
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryButtonColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  if (_model.fromImage)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'PLANT_SEARCH_SELECT_IMAGE_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_upload_media_to_firebase');
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              maxWidth: 16384.00,
                                              maxHeight: 16384.00,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                                showUploadMessage(
                                                    context, 'Success!');
                                              } else {
                                                safeSetState(() {});
                                                showUploadMessage(context,
                                                    'Failed to upload data');
                                                return;
                                              }
                                            }

                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.recognizedPlantName = ' ';
                                            _model.recognizedPlantScientificName =
                                                ' ';
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Button_backend_call');
                                            _model.recognizedPlantAPIResult2 =
                                                await GetPlantURLCall.call(
                                              imageURL: _model.uploadedFileUrl,
                                            );

                                            if ((_model
                                                    .recognizedPlantAPIResult2
                                                    ?.succeeded ??
                                                true)) {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.recognizedPlantName =
                                                  GetPlantURLCall.commonNames(
                                                (_model.recognizedPlantAPIResult2
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                      .firstOrNull!;
                                              _model.recognizedPlantScientificName =
                                                  GetPlantURLCall.bestMatch(
                                                (_model.recognizedPlantAPIResult2
                                                        ?.jsonBody ??
                                                    ''),
                                              )!;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Plant not recognized',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.recognizedPlantName =
                                                  'not recognized';
                                              _model.recognizedPlantScientificName =
                                                  '';
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Select Image',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryButtonColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  functions.stringAsImagePath(
                                                      valueOrDefault<String>(
                                                    _model.plantURL,
                                                    'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                                  )),
                                                  'https://cdn.permapeople.org/permapeople-permaculture-plant-database-blank.jpg',
                                                ),
                                              ).image,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name: ${_model.recognizedPlantName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Itim',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'Scientific Name: ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Itim',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            '    ${_model.recognizedPlantScientificName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Itim',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Opacity(
                                              opacity: 0.9,
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PLANT_SEARCH_RichText_4gwxvf5r_ON_TAP');
                                                      logFirebaseEvent(
                                                          'RichText_alert_dialog');
                                                      await showAlignedDialog(
                                                        context: context,
                                                        isGlobal: false,
                                                        avoidOverflow: true,
                                                        targetAnchor:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        followerAnchor:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        builder:
                                                            (dialogContext) {
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: SizedBox(
                                                                height: 690.0,
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    SimilarImagesPlantWidget(
                                                                  permapeopleImage:
                                                                      _model
                                                                          .plantURL,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Similar Images',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Itim',
                                                                  color: const Color(
                                                                      0xFF3845C3),
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PLANT_SEARCH_SEARCH_THIS_PLANT_BTN_ON_TA');
                                              if ((_model.recognizedPlantName !=
                                                      'not recognized') &&
                                                  (_model.recognizedPlantName !=
                                                      '')) {
                                                logFirebaseEvent(
                                                    'Button_set_form_field');
                                                safeSetState(() {
                                                  _model.searchBarTextController
                                                          ?.text =
                                                      _model
                                                          .recognizedPlantName;
                                                });
                                                logFirebaseEvent(
                                                    'Button_action_block');
                                                await _model
                                                    .resetPlants(context);
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Button_action_block');
                                                await _model
                                                    .searchForPlants(context);
                                                safeSetState(() {});
                                              }
                                            },
                                            text: 'Search this plant',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryButtonColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: Stack(
                        children: [
                          Builder(
                            builder: (context) {
                              final listViewPlantRow =
                                  _model.searchedPlants.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewPlantRow.length,
                                itemBuilder: (context, listViewPlantRowIndex) {
                                  final listViewPlantRowItem =
                                      listViewPlantRow[listViewPlantRowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'PLANT_SEARCH_Container_bfv2n0sx_ON_TAP');
                                      logFirebaseEvent('Container_navigate_to');

                                      context.pushNamed(
                                        'PlantInfo',
                                        queryParameters: {
                                          'permapeopleId': serializeParam(
                                            valueOrDefault<int>(
                                              listViewPlantRowItem
                                                  .permapeopleId,
                                              0,
                                            ),
                                            ParamType.int,
                                          ),
                                          'addPlantMode': serializeParam(
                                            widget.addPlantMode,
                                            ParamType.bool,
                                          ),
                                          'plantParameter': serializeParam(
                                            listViewPlantRowItem,
                                            ParamType.SqliteRow,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 105.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .borderColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  listViewPlantRowItem
                                                      .thumbImage,
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewPlantRowItem
                                                            .name,
                                                        'Name',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Itim',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewPlantRowItem
                                                            .scientificName,
                                                        'ScientificName',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Itim',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewPlantRowItem
                                                            .type,
                                                        'Type',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Itim',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        listViewPlantRowItem
                                                            .family,
                                                        'Family',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Itim',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          if (_model.searchedPlants.isEmpty)
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                () {
                                  if (isWeb) {
                                    return 'Search function not supported on the web.';
                                  } else if (_model.loadingPlants) {
                                    return 'Loading Plants...';
                                  } else if (_model
                                          .searchBarTextController.text !=
                                      '') {
                                    return 'No results found';
                                  } else {
                                    return '';
                                  }
                                }(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Itim',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ].divide(const SizedBox(height: 2.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
