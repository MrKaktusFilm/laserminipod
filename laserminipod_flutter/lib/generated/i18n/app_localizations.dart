import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @holdManagementOptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Handle Management'**
  String get holdManagementOptionTitle;

  /// No description provided for @holdManagementOptionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add, edit and delete handles'**
  String get holdManagementOptionSubtitle;

  /// No description provided for @changePasswordOptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordOptionTitle;

  /// No description provided for @changePasswordOptionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change Admin login credentials'**
  String get changePasswordOptionSubtitle;

  /// No description provided for @changePasswordPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordPageTitle;

  /// No description provided for @changePasswordPageCurrentTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get changePasswordPageCurrentTextFieldLabel;

  /// No description provided for @changePasswordPageValidatorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get changePasswordPageValidatorEmpty;

  /// No description provided for @changePasswordPageNewTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get changePasswordPageNewTextFieldLabel;

  /// No description provided for @changePasswordPageConfirmTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get changePasswordPageConfirmTextFieldLabel;

  /// No description provided for @changePasswordPageValidatorConfirmEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your new password'**
  String get changePasswordPageValidatorConfirmEmpty;

  /// No description provided for @changePasswordPageValidatorConfirmNoMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get changePasswordPageValidatorConfirmNoMatch;

  /// No description provided for @changePasswordPageButton.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePasswordPageButton;

  /// No description provided for @deleteRouteDialogText.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete this route?'**
  String get deleteRouteDialogText;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @adminLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin Login'**
  String get adminLoginTitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get enterPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @routeName.
  ///
  /// In en, this message translates to:
  /// **'Name of the route:'**
  String get routeName;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @errorOccured.
  ///
  /// In en, this message translates to:
  /// **'An error has occured'**
  String get errorOccured;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get chooseLanguage;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @spraywallTitle.
  ///
  /// In en, this message translates to:
  /// **'Spraywall'**
  String get spraywallTitle;

  /// No description provided for @routeListTitle.
  ///
  /// In en, this message translates to:
  /// **'Routes'**
  String get routeListTitle;

  /// No description provided for @administrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Administration'**
  String get administrationTitle;

  /// No description provided for @logoutError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while logging out'**
  String get logoutError;

  /// No description provided for @invalidLogin.
  ///
  /// In en, this message translates to:
  /// **'Invalid login credentials'**
  String get invalidLogin;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'An error occured while logging in'**
  String get loginFailed;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get register;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password successfully changed'**
  String get passwordChanged;

  /// No description provided for @passwordChangeError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Password couldn\'t be changed'**
  String get passwordChangeError;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a new password'**
  String get enterNewPassword;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'The password must be at least 8 characters long'**
  String get passwordLengthError;

  /// No description provided for @saveHandleError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while saving the hold'**
  String get saveHandleError;

  /// No description provided for @deleteHandleError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while deleting the hold'**
  String get deleteHandleError;

  /// No description provided for @imageDimensionsError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while loading the image dimensions'**
  String get imageDimensionsError;

  /// No description provided for @routeExists.
  ///
  /// In en, this message translates to:
  /// **'The route already exists'**
  String get routeExists;

  /// No description provided for @routeSaved.
  ///
  /// In en, this message translates to:
  /// **'Route successfully saved'**
  String get routeSaved;

  /// No description provided for @routeSaveError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while saving the route'**
  String get routeSaveError;

  /// No description provided for @routeNameTaken.
  ///
  /// In en, this message translates to:
  /// **'Another route already has this name'**
  String get routeNameTaken;

  /// No description provided for @routeNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'The name cannot be empty'**
  String get routeNameEmpty;

  /// No description provided for @routeAlreadyCreated.
  ///
  /// In en, this message translates to:
  /// **'The created route already exists'**
  String get routeAlreadyCreated;

  /// No description provided for @routeLoadError.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the routes'**
  String get routeLoadError;

  /// No description provided for @routeDeleteError.
  ///
  /// In en, this message translates to:
  /// **'There was an error deleting the route'**
  String get routeDeleteError;

  /// No description provided for @loadHandleError.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the holds'**
  String get loadHandleError;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'An error occured'**
  String get error;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get enterUsername;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPassword;

  /// No description provided for @createUserError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while creating an User'**
  String get createUserError;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Only available for logged in users'**
  String get loginRequired;

  /// No description provided for @adminRequired.
  ///
  /// In en, this message translates to:
  /// **'Admin rights are needed'**
  String get adminRequired;

  /// No description provided for @deleteUserError.
  ///
  /// In en, this message translates to:
  /// **'An error occured while deleting your account'**
  String get deleteUserError;

  /// No description provided for @deleteUserDialog.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete your account?'**
  String get deleteUserDialog;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete your account'**
  String get deleteUser;

  /// No description provided for @routeDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get routeDescription;

  /// No description provided for @selectDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Select Difficulty'**
  String get selectDifficulty;

  /// No description provided for @myProjects.
  ///
  /// In en, this message translates to:
  /// **'My Projects'**
  String get myProjects;

  /// No description provided for @myRoutes.
  ///
  /// In en, this message translates to:
  /// **'My Routes'**
  String get myRoutes;

  /// No description provided for @allRoutes.
  ///
  /// In en, this message translates to:
  /// **'All Routes'**
  String get allRoutes;

  /// No description provided for @userNameTaken.
  ///
  /// In en, this message translates to:
  /// **'The username is already taken'**
  String get userNameTaken;

  /// No description provided for @emailTaken.
  ///
  /// In en, this message translates to:
  /// **'An user with this email already exists'**
  String get emailTaken;

  /// No description provided for @projectAdded.
  ///
  /// In en, this message translates to:
  /// **'Added to projects'**
  String get projectAdded;

  /// No description provided for @projectLoadError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading the projects'**
  String get projectLoadError;

  /// No description provided for @addToProjects.
  ///
  /// In en, this message translates to:
  /// **'Add to Projects'**
  String get addToProjects;

  /// No description provided for @removeFromProjects.
  ///
  /// In en, this message translates to:
  /// **'Remove from Projects'**
  String get removeFromProjects;

  /// No description provided for @addToSents.
  ///
  /// In en, this message translates to:
  /// **'Completed!'**
  String get addToSents;

  /// No description provided for @removeFromSents.
  ///
  /// In en, this message translates to:
  /// **'Not completed'**
  String get removeFromSents;

  /// No description provided for @emptyRouteList.
  ///
  /// In en, this message translates to:
  /// **'This emptiness... it\'s consuming me'**
  String get emptyRouteList;

  /// No description provided for @sorting.
  ///
  /// In en, this message translates to:
  /// **'Sorting'**
  String get sorting;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get sent;

  /// No description provided for @notSent.
  ///
  /// In en, this message translates to:
  /// **'Not sent'**
  String get notSent;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'---'**
  String get none;

  /// No description provided for @creator.
  ///
  /// In en, this message translates to:
  /// **'Creator'**
  String get creator;

  /// No description provided for @minDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Minimum difficulty'**
  String get minDifficulty;

  /// No description provided for @maxDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Maximum difficulty'**
  String get maxDifficulty;

  /// No description provided for @resetFilters.
  ///
  /// In en, this message translates to:
  /// **'Reset filters'**
  String get resetFilters;

  /// No description provided for @alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get alphabetical;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get newest;

  /// No description provided for @oldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest first'**
  String get oldest;

  /// No description provided for @hardest.
  ///
  /// In en, this message translates to:
  /// **'Hardest first'**
  String get hardest;

  /// No description provided for @easiest.
  ///
  /// In en, this message translates to:
  /// **'Easiest first'**
  String get easiest;

  /// No description provided for @mostSents.
  ///
  /// In en, this message translates to:
  /// **'Most sents first'**
  String get mostSents;

  /// No description provided for @leastSents.
  ///
  /// In en, this message translates to:
  /// **'Least sents first'**
  String get leastSents;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @routeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please select a route first'**
  String get routeEmpty;

  /// No description provided for @newUserName.
  ///
  /// In en, this message translates to:
  /// **'New username'**
  String get newUserName;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Give your feedback!'**
  String get feedback;

  /// No description provided for @feedbackError.
  ///
  /// In en, this message translates to:
  /// **'Feedback could not be submitted'**
  String get feedbackError;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Reset failed'**
  String get resetPasswordError;

  /// No description provided for @resetInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'The code is invalid'**
  String get resetInvalidCode;

  /// No description provided for @emailSent.
  ///
  /// In en, this message translates to:
  /// **'An email with the reset code has been sent to'**
  String get emailSent;

  /// No description provided for @requestCode.
  ///
  /// In en, this message translates to:
  /// **'Request Code'**
  String get requestCode;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Did you enter your email address correctly?'**
  String get emailError;

  /// No description provided for @enterValidationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to {email}:'**
  String enterValidationCode(Object email);

  /// No description provided for @draw.
  ///
  /// In en, this message translates to:
  /// **'Draw'**
  String get draw;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @navigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate'**
  String get navigate;

  /// No description provided for @feedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'What\'s wrong?'**
  String get feedbackDescription;

  /// No description provided for @switchBoulder.
  ///
  /// In en, this message translates to:
  /// **'Switch Boulder'**
  String get switchBoulder;

  /// No description provided for @spraywallName.
  ///
  /// In en, this message translates to:
  /// **'Name of the spraywall'**
  String get spraywallName;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get enterName;

  /// No description provided for @changeSpraywallName.
  ///
  /// In en, this message translates to:
  /// **'Change name of the spraywall'**
  String get changeSpraywallName;

  /// No description provided for @changeSpraywallNameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The name of your spraywall, which the users will see'**
  String get changeSpraywallNameSubtitle;

  /// No description provided for @selectSpraywall.
  ///
  /// In en, this message translates to:
  /// **'Select Spraywall'**
  String get selectSpraywall;

  /// No description provided for @selectExistingSpraywall.
  ///
  /// In en, this message translates to:
  /// **'Or select a previously visited Spraywall'**
  String get selectExistingSpraywall;

  /// No description provided for @spraywallDropdownLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Spraywall'**
  String get spraywallDropdownLabel;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @enterUrlManually.
  ///
  /// In en, this message translates to:
  /// **'Enter URL manually'**
  String get enterUrlManually;

  /// No description provided for @enterServerUrl.
  ///
  /// In en, this message translates to:
  /// **'Enter server URL'**
  String get enterServerUrl;

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection failed'**
  String get connectionFailed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
