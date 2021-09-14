Ext.layout.UXCardLayout=Ext.extend(Ext.layout.CardLayout,{setActiveItem:function(item){  
    item=this.container.getComponent(item);  
    if(this.activeItem!=item){  
      if(this.activeItem){  
        this.activeItem.hide();  
      }  
      if(this.activeItem&&!this.activeItem.hidden){  
        return ;  
      }  
      this.activeItem=item;  
      item.show();  
      this.layout();  
    }  
  }});  
Ext.UXWizHeader=Ext.extend(Ext.BoxComponent,{height:55,region:"north",title:"Wizard",steps:0,stepText:"Step {0} of {1}: {2}",autoEl:{tag:"div",cls:"ext-ux-wiz-Header",children:[{tag:"div",cls:"ext-ux-wiz-Header-title"},{tag:"div",children:[{tag:"div",cls:"ext-ux-wiz-Header-step"},{tag:"div",cls:"ext-ux-wiz-Header-stepIndicator-container"}]}]},titleEl:null,stepEl:null,imageContainer:null,indicators:null,stepTemplate:null,lastActiveStep:-1,updateStep:function(currentStep,title){  
    var html=this.stepTemplate.apply({0:currentStep+1,1:this.steps,2:title});  
    this.stepEl.update(html);  
    if(this.lastActiveStep!=-1){  
      this.indicators[this.lastActiveStep].removeClass("ext-ux-wiz-Header-stepIndicator-active");  
    }  
    this.indicators[currentStep].addClass("ext-ux-wiz-Header-stepIndicator-active");  
    this.lastActiveStep=currentStep;  
  },onRender:function(ct,position){  
    Ext.UXWizHeader.superclass.onRender.call(this,ct,position);  
    this.indicators=[];  
    this.stepTemplate=new Ext.Template(this.stepText),this.stepTemplate.compile();  
    var el=this.el.dom.firstChild;  
    var ns=el.nextSibling;  
    this.titleEl=new Ext.Element(el);  
    this.stepEl=new Ext.Element(ns.firstChild);  
    this.imageContainer=new Ext.Element(ns.lastChild);  
    this.titleEl.update(this.title);  
    var image=null;  
    for(var i=0,len=this.steps;i<len;i++){  
      image=document.createElement("div");  
      image.innerHTML="&#160;";  
      image.className="ext-ux-wiz-Header-stepIndicator";  
      this.indicators[i]=new Ext.Element(image);  
      this.imageContainer.appendChild(image);  
    }  
  }});  
Ext.UXWiz=Ext.extend(Ext.Window,{loadMaskConfig:{"default":"Saving..."},height:400,width:540,closable:true,resizable:false,modal:true,cards:null,previousButtonText:"&lt; Previous",nextButtonText:"Next &gt;",cancelButtonText:"Cancel",finishButtonText:"Finish",headerConfig:{},cardPanelConfig:{},previousButton:null,nextButton:null,cancelButton:null,cardPanel:null,currentCard:-1,headPanel:null,cardCount:0,initComponent:function(){  
    this.initButtons();  
    this.initPanels();  
    var title=this.title||this.headerConfig.title;  
    title=title||"";  
    Ext.apply(this,{title:title,layout:"border",cardCount:this.cards.length,buttons:[this.previousButton,this.nextButton,this.cancelButton],items:[this.headPanel,this.cardPanel]});  
    this.addEvents("cancel","finish");  
    Ext.UXWiz.superclass.initComponent.call(this);  
    this.cardPanel.activeItem=0;  
  },getWizardData:function(){  
    var formValues={};  
    var cards=this.cards;  
    for(var i=0,len=cards.length;i<len;i++){  
      if(cards[i].form){  
        formValues[cards[i].id]=cards[i].form.getValues(false);  
      }else {  
        formValues[cards[i].id]={};  
      }  
    }  
    return formValues;  
  },switchDialogState:function(enabled,type){  
    this.showLoadMask(!enabled,type);  
    this.previousButton.setDisabled(!enabled);  
    this.nextButton.setDisabled(!enabled);  
    this.cancelButton.setDisabled(true);  
    if(this.closable){  
      var ct=this.tools["close"];  
      switch(enabled){  
      case true:  
        this.tools["close"].unmask();  
        break ;  
      default:  
        this.tools["close"].mask();  
        break ;  
      }  
    }  
  },showLoadMask:function(show,type){  
    if(!type){  
      type="default";  
    }  
    if(show){  
      if(this.loadMask==null){  
        this.loadMask=new Ext.LoadMask(this.body);  
      }  
      this.loadMask.msg=this.loadMaskConfig["type"];  
      this.loadMask.show();  
    }else {  
      if(this.loadMask){  
        this.loadMask.hide();  
      }  
    }  
  },initPanelsEvents:function(){  
    var cards=this.cards;  
    for(var i=0,len=cards.length;i<len;i++){  
      cards[i].on("show",this.onCardShow,this);  
      cards[i].on("hide",this.onCardHide,this);  
      cards[i].on("clientvalidation",this.onClientValidation,this);  
    }  
  },initPanels:function(){  
    var cards=this.cards;  
    var cardPanelConfig=this.cardPanelConfig;  
    Ext.apply(this.headerConfig,{steps:cards.length});  
    this.headPanel=new Ext.UXWizHeader(this.headerConfig);  
    Ext.apply(cardPanelConfig,{layout:new Ext.layout.UXCardLayout(),items:cards});  
    this.initPanelsEvents();  
    Ext.applyIf(cardPanelConfig,{region:"center",border:false,activeItem:0});  
    this.cardPanel=new Ext.Panel(cardPanelConfig);  
  },initButtons:function(){  
    this.previousButton=new Ext.Button({text:this.previousButtonText,disabled:true,minWidth:75,handler:this.onPreviousClick,scope:this});  
    this.nextButton=new Ext.Button({text:this.nextButtonText,minWidth:75,handler:this.onNextClick,scope:this});  
    this.cancelButton=new Ext.Button({text:this.cancelButtonText,handler:this.onCancelClick,scope:this,minWidth:75});  
  },onClientValidation:function(card,isValid){  
    if(!isValid){  
      this.nextButton.setDisabled(true);  
    }else {  
      this.nextButton.setDisabled(false);  
    }  
  },onCardHide:function(card){  
    if(this.cardPanel.layout.activeItem.id===card.id){  
      this.nextButton.setDisabled(true);  
    }  
  },onCardShow:function(card){  
    var parent=card.ownerCt;  
    var items=parent.items;  
    for(var i=0,len=items.length;i<len;i++){  
      if(items.get(i).id==card.id){  
        break ;  
      }  
    }  
    this.currentCard=i;  
    this.headPanel.updateStep(i,card.title);  
    if(i==len-1){  
      this.nextButton.setText(this.finishButtonText);  
    }else {  
      this.nextButton.setText(this.nextButtonText);  
    }  
    if(card.isValid()){  
      this.nextButton.setDisabled(false);  
    }  
    if(i==0){  
      this.previousButton.setDisabled(true);  
    }else {  
      this.previousButton.setDisabled(false);  
    }  
  },onCancelClick:function(){  
    if(this.fireEvent("cancel",this)!==false){  
      this.close();  
    }  
  },onFinish:function(){  
    if(this.fireEvent("finish",this,this.getWizardData())!==false){  
      this.close();  
    }  
  },onPreviousClick:function(){  
    if(this.currentCard>0){  
      this.cardPanel.getLayout().setActiveItem(this.currentCard-1);  
    }  
  },onNextClick:function(){  
    if(this.currentCard==this.cardCount-1){  
      this.onFinish();  
    }else {  
      this.cardPanel.getLayout().setActiveItem(this.currentCard+1);  
    }  
  }});  
Ext.UXWizCard=Ext.extend(Ext.FormPanel,{header:false,hideMode:"display",initComponent:function(){  
    this.addEvents("beforecardhide");  
    Ext.UXWizCard.superclass.initComponent.call(this);  
  },isValid:function(){  
    if(this.monitorValid){  
      return this.bindHandler();  
    }  
    return true;  
  },bindHandler:function(){  
    var valid=true;  
    this.form.items.each(function(f){  
      if(f.isValid&&!f.isValid(true)){  
        valid=false;  
        return false;  
      }  
    });  
    if(this.buttons){  
      for(var i=0,len=this.buttons.length;i<len;i++){  
        var btn=this.buttons[i];  
        if(btn.formBind===true&&btn.disabled===valid){  
          btn.setDisabled(!valid);  
        }  
      }  
    }  
    this.fireEvent("clientvalidation",this,valid);  
  },initEvents:function(){  
    var old=this.monitorValid;  
    this.monitorValid=false;  
    Ext.UXWizCard.superclass.initEvents.call(this);  
    this.monitorValid=old;  
    this.on("beforehide",this.bubbleBeforeHideEvent,this);  
    this.on("beforecardhide",this.isValid,this);  
    this.on("show",this.onCardShow,this);  
    this.on("hide",this.onCardHide,this);  
  },bubbleBeforeHideEvent:function(){  
    var ly=this.ownerCt.layout;  
    var activeItem=ly.activeItem;  
    if(activeItem&&activeItem.id===this.id){  
      return this.fireEvent("beforecardhide",this);  
    }  
    return true;  
  },onCardHide:function(){  
    if(this.monitorValid){  
      this.stopMonitoring();  
    }  
  },onCardShow:function(){  
    if(this.monitorValid){  
      this.startMonitoring();  
    }  
  }});  