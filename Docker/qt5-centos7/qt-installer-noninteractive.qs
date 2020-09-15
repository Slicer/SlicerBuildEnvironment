// Emacs mode hint: -*- mode: JavaScript -*-

function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })

    // Copied from https://bugreports.qt.io/browse/QTIFW-1072?jql=project%20%3D%20QTIFW
    // there are some changes between Qt Online installer 3.0.1 and 3.0.2. Welcome page does some network
    // queries that is why the next button is called too early. 
    var page = gui.pageWidgetByObjectName("WelcomePage")
    page.completeChanged.connect(welcomepageFinished)
}

Controller.prototype.WelcomePageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

welcomepageFinished = function()
{
    //completeChange() -function is called also when other pages visible
    //Make sure that next button is clicked only when in welcome page
    if(gui.currentPageWidget().objectName == "WelcomePage") {
        gui.clickButton( buttons.NextButton);   
    }
}

//From : https://github.com/rabits/dockerfiles/blob/93d2d5b1d8f4c5fba9db67086a945e7462011707/5.14-desktop/extract-qt-installer.sh
Controller.prototype.CredentialsPageCallback = function() {
    console.log("Credentials Page");
    var login = installer.value("QT_CI_LOGIN");
    var password = installer.value("QT_CI_PASSWORD");
    if( login === "" || password === "" ) {
        console.log("No credentials provided - could stuck here forever");
        gui.clickButton(buttons.NextButton);
    }
    var widget = gui.currentPageWidget();
    widget.loginWidget.EmailLineEdit.setText(login);
    widget.loginWidget.PasswordLineEdit.setText(password);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/qt");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    function list_packages() {
        var components = installer.components();
        console.log("Available components: " + components.length);
        var packages = ["Packages: "];
        for (var i = 0 ; i < components.length ;i++) {
            packages.push(components[i].name);
        }
        console.log(packages.join(" "));
    }
  
    list_packages();
    
    var widget = gui.currentPageWidget();

    widget.deselectAll();

    //widget.selectComponent("qt");
    //widget.selectComponent("qt.qt5.5151");
    widget.selectComponent("qt.qt5.5151.gcc_64");
    widget.selectComponent("qt.qt5.5151.qtscript");
    widget.selectComponent("qt.qt5.5151.qtscript.gcc_64");
    widget.selectComponent("qt.qt5.5151.qtwebengine");
    widget.selectComponent("qt.qt5.5151.qtwebengine.gcc_64");
    //widget.selectComponent("qt.qt5.5151.qtwebglplugin");
    //widget.selectComponent("qt.qt5.5151.qtwebglplugin.gcc_64");
    //widget.selectComponent("qt.tools");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
    var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm
    if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
        checkBoxForm.launchQtCreatorCheckBox.checked = false;
    }
    gui.clickButton(buttons.FinishButton);
}

Controller.prototype.ObligationsPageCallback = function() {
    console.log("Accept obligation agreement");
    var page = gui.pageWidgetByObjectName("ObligationsPage");
    page.obligationsAgreement.setChecked(true);
    page.completeChanged();
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.DynamicTelemetryPluginFormCallback = function() {
    var page = gui.pageWidgetByObjectName("DynamicTelemetryPluginForm");
    page.statisticGroupBox.disableStatisticRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.PerformInstallationPageCallback = function() {
    gui.clickButton(buttons.CommitButton);
}
