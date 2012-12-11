/**
 * @name MFT.ApplinkNonMediaModel
 * 
 * @desc Data model for Applink NonMedia application
 * 
 * @category	Model
 * @filesource	app/model/applink/ApplinkNonMediaModel.js
 * @version		1.0
 *
 * @author		Artem Petrosyan
 */

MFT.ApplinkNonMediaModel = Em.Object.create({

	/**
      * Array of menus in ApplinkOptionsSubMenuView
      */
    subMenuCommands:            new Array(),

    /**
      * Info data
      */
    showInfo: Em.Object.create({
        field1:         '<field1>',
        field2:         '<field2>',
        field3:         '<field3>',
        field4:         '<field4>',
        mediaClock:     '<mediaClock>',
        statusBar:      '<statusBar',
        appName:        '<App name>',
        deviceName:     '<Device name>'
    }),

    /**
      * Info data
      */
    alertInfo: Em.Object.create({
        text1:          '<text1>',
        text2:          '<text2>',
        text3:          '<text3>',
        ttsChunks:      null,
        duration:       0,
        playTone:       null,
        softButtons:    null,
        tryAgainTime:   0
    }),
	
	/** Add command to Options list */
    onApplinkOptionsAddCommand: function( commandId, params ){

       MFT.InfoNonMediaOptions.AddCommand( commandId, params );

    },
	
	/** Applink UI Show handler */
    onApplinkUIShow: function( params ){
        this.showInfo.set('field1',		params.mainField1);
        this.showInfo.set('field2',		params.mainField2);
        this.showInfo.set('mediaClock',	params.mediaClock);
		this.showInfo.set('field3',		params.mediaTrack);
        this.showInfo.set('statusBar',	params.statusBar);
    },
    
    /** Applin UI Alert handler */
    onApplinkUIAlert: function(params){
        MFT.AlertPopUp.AlertActive(params.AlertText1, params.AlertText2, params.duration, params.playTone);
    },
    
    /** Applink AddCommand handler */
    onApplinkAddCommand: function(params){
        if( params.menuParams.parentID == 0 ){
            this.onApplinkOptionsAddCommand(params.cmdId, params.menuParams);
        }else{
            this.subMenuCommands.push(params);
            if(MFT.States.info.nonMedia.options.subMenu.active){
                MFT.InfoNonMediaOptionsSubMenu.SubMenuActivate(MFT.NonMediaController.currentApplinkSubMenuid);
            }

        }
    },
    
    /** Delete command to Options list */
    onApplinkOptionsDeleteCommand: function(commandId){

        MFT.InfoNonMediaOptions.DeleteCommand( commandId );

        var  count = this.subMenuCommands.length;
        for(var i = count-1; i >= 0; i--){
            if(this.subMenuCommands[i].cmdId == commandId){
               this.subMenuCommands.splice(i, 1);
            }
        }
    },
    
    /** Add subMenu button to Options list */
    onApplinkAddSubMenu: function( menuId, params ){

        MFT.InfoNonMediaOptions.AddSubMenu( menuId, params );

    },
    
    /** Delete subMenu button from Options list */
    onApplinkDeleteSubMenu: function( menuId ){

        if( MFT.NonMediaController.currentApplinkSubMenuid == menuId ){
            MFT.States.back();
        }

        MFT.InfoNonMediaOptions.DeleteSubMenu( menuId );

        return "SUCCESS";
    },
    
    /** Delete all commands in sub menu from VR */
    onApplinkCreateInteractionChoise: function(params){
		return;
    },
    
    /** Delete all commands in sub menu from VR */
    onApplinkDeleteInteractionChoise: function(choiseSetID){
		return;
    },
    
    /** Switching on Applink Perform Interaction Choise */
    turnOnApplinkPerform: function(params){
        return;
    },
    
    /** Applink Setter for Media Clock Timer */
    applinkSetMediaClockTimer: function(params){
		return;
    },
    
    /** Applink Slider activation */
    onApplinkSlider: function(params){
    	return;
    },


    /** Applin UI Show handler */
    onApplinkUIShow: function(params){
        clearInterval(this.timer);
        this.showInfo.set('field1',        params.mainField1);
        this.showInfo.set('field2',        params.mainField2);
        this.showInfo.set('field3',        params.mainField3);
        this.showInfo.set('field4',        params.mainField4);
        this.showInfo.set('alignment',     params.alignment);
        this.showInfo.set('statusBar',     params.statusBar);
        this.showInfo.set('mediaClock',    params.mediaClock);
        this.showInfo.set('mediaTrack',    params.mediaTrack);
        this.showInfo.set('image',         params.graphic);
        this.showInfo.set('softButtons',   params.softButtons);        
        this.showInfo.set('customPresets', params.customPresets);

        // appId
    },

    /** Applin UI Alert handler */
    onApplinkUIAlert: function(params){

        this.alertInfo.set('text1', params.AlertText1);
        this.alertInfo.set('text2', params.AlertText2);
        this.alertInfo.set('text3', params.alertText3);
        this.alertInfo.set('ttsChunks', params.ttsChunks );
        this.alertInfo.set('duration', params.duration );
        this.alertInfo.set('playTone', params.playTone );
        this.alertInfo.set('softButtons', params.softButtons );
        this.alertInfo.set('tryAgainTime', params.tryAgainTime );

        // appId

        MFT.AlertPopUp.AlertActive();

    }
});