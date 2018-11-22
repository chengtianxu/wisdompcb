unit PpCutting_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base, ExtCtrls, Grids, DBGridEh, DB, DBClient, cds, Provider,
  ADODB, StdCtrls, Mask, DBCtrls, Menus, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, RzEdit, RzDBEdit, RzDBBnEd, DBButtonEdit,
  cxTextEdit, cxDBEdit, RzBtnEdt, ButtonEdit,math;
                   //Ceil函数用到math这个单元文件。 
type
  TPpCutting_1_frm = class(TBase_f)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_lam2: TDBEdit;
    edt_lam_ty_gp: TDBEdit;
    Panel3: TPanel;
    bt_Cancel: TButton;
    bt_OK: TButton;
    dtMain: TADODataSet;
    dspMain: TDataSetProvider;
    cds735: Tcds;
    cds735SUPPLIER2: TStringField;
    cds735BARCODE_ID: TStringField;
    cds735ABBR_NAME: TStringField;
    cds735QUANTITY: TBCDField;
    cds735EXPIRE_DATE: TDateTimeField;
    cds735rkey733: TIntegerField;
    cds735rkey730: TIntegerField;
    dsMain: TDataSource;
    PopupMenu1: TPopupMenu;
    N_SelectItme: TMenuItem;
    cds0730_1: TClientDataSet;
    cds0730_1ABBR_NAME: TStringField;
    cds0730_1QTY: TIntegerField;
    cds0730_1INV_PART_NUMBER: TStringField;
    cds0730_1INV_NAME: TStringField;
    cds0730_1INV_DESCRIPTION: TStringField;
    cds0730_1UNIT_CODE: TStringField;
    cds0730_1SUPPLIER2: TStringField;
    cds0730_1BARCODE_ID: TStringField;
    cds0730_1RKEY: TIntegerField;
    cds0730_1D207_PTR: TIntegerField;
    cds0730_1D017_PTR: TIntegerField;
    cds0730_1D002_PTR: TIntegerField;
    cds0730_1QUANTITY: TBCDField;
    cds0730_1TDATE: TDateTimeField;
    cds0730_1empl_ptr: TIntegerField;
    cds0730_1EXPIRE_DATE: TDateTimeField;
    cds0730_1DescText: TStringField;
    DghMain: TDBGridEh;
    cds0730_1IES_PARAMETER_VALUE3: TStringField;
    cds735IES_PARAMETER_VALUE3: TIntegerField;
    dtRead: TADODataSet;
    dtMainSUPPLIER2: TStringField;
    dtMainBARCODE_ID: TStringField;
    dtMainABBR_NAME: TStringField;
    dtMainQUANTITY: TBCDField;
    dtMainEXPIRE_DATE: TDateTimeField;
    dtMainIES_PARAMETER_VALUE3: TIntegerField;
    dtMainrkey733: TIntegerField;
    dtMainrkey730: TIntegerField;
    dtMainpp_quota_len: TBCDField;
    Label5: TLabel;
    Label6: TLabel;
    edt_EMPLOYEE_NAME: TEdit;
    edt_panel_qty: TEdit;
    edt_pp_quota_len: TEdit;
    dtMainIES_PARAMETER_VALUE2: TIntegerField;
    cds735IES_PARAMETER_VALUE2: TIntegerField;
    dspRead: TDataSetProvider;
    cds0730_1IES_PARAMETER_VALUE2: TStringField;
    cds0017: TClientDataSet;
    dsp0730: TDataSetProvider;
    dt0730: TADOQuery;
    dt0730INV_PART_NUMBER: TStringField;
    dt0730INV_NAME: TStringField;
    dt0730INV_DESCRIPTION: TStringField;
    dt0730UNIT_CODE: TStringField;
    dt0730SUPPLIER2: TStringField;
    dt0730BARCODE_ID: TStringField;
    dt0730ABBR_NAME: TStringField;
    dt0730QTY: TIntegerField;
    dt0730IES_PARAMETER_VALUE2: TStringField;
    dt0730IES_PARAMETER_VALUE3: TStringField;
    dt0730RKEY: TAutoIncField;
    dt0730D207_PTR: TIntegerField;
    dt0730D017_PTR: TIntegerField;
    dt0730D002_PTR: TIntegerField;
    dt0730QUANTITY: TBCDField;
    dt0730TDATE: TDateTimeField;
    dt0730empl_ptr: TIntegerField;
    dt0730EXPIRE_DATE: TDateTimeField;
    dt0730DescText: TStringField;
    dtMainQUAN_ON_HAND_2: TFloatField;
    cds735QUAN_ON_HAND_2: TFloatField;
    dt0730QUAN_ON_HAND_2: TFloatField;
    cds0730_1QUAN_ON_HAND_2: TFloatField;
    dtMainQUAN_ON_HAND_1: TFloatField;
    cds735QUAN_ON_HAND_1: TFloatField;
    dt0730QUAN_ON_HAND_1: TFloatField;
    cds0730_1QUAN_ON_HAND_1: TFloatField;
    edt_pp_quota_roll: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Memo_remark: TMemo;
    dtMainpp_quota_roll: TFloatField;
    cds0730: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    ADODataSet1: TADODataSet;
    cds0730INV_PART_NUMBER: TStringField;
    cds0730INV_NAME: TStringField;
    cds0730INV_DESCRIPTION: TStringField;
    cds0730UNIT_CODE: TStringField;
    cds0730SUPPLIER2: TStringField;
    cds0730BARCODE_ID: TStringField;
    cds0730ABBR_NAME: TStringField;
    cds0730QTY: TIntegerField;
    cds0730IES_PARAMETER_VALUE2: TStringField;
    cds0730IES_PARAMETER_VALUE3: TStringField;
    cds0730RKEY: TAutoIncField;
    cds0730D207_PTR: TIntegerField;
    cds0730D017_PTR: TIntegerField;
    cds0730D002_PTR: TIntegerField;
    cds0730QUANTITY: TBCDField;
    cds0730TDATE: TDateTimeField;
    cds0730empl_ptr: TIntegerField;
    cds0730QUAN_ON_HAND_1: TBCDField;
    cds0730QUAN_ON_HAND_2: TBCDField;
    cds0730EXPIRE_DATE: TDateTimeField;
    cds0730DescText: TStringField;
    ADODataSet1INV_PART_NUMBER: TStringField;
    ADODataSet1INV_NAME: TStringField;
    ADODataSet1INV_DESCRIPTION: TStringField;
    ADODataSet1UNIT_CODE: TStringField;
    ADODataSet1SUPPLIER2: TStringField;
    ADODataSet1BARCODE_ID: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1QTY: TIntegerField;
    ADODataSet1IES_PARAMETER_VALUE2: TStringField;
    ADODataSet1IES_PARAMETER_VALUE3: TStringField;
    ADODataSet1RKEY: TAutoIncField;
    ADODataSet1D207_PTR: TIntegerField;
    ADODataSet1D017_PTR: TIntegerField;
    ADODataSet1D002_PTR: TIntegerField;
    ADODataSet1QUANTITY: TBCDField;
    ADODataSet1TDATE: TDateTimeField;
    ADODataSet1empl_ptr: TIntegerField;
    ADODataSet1QUAN_ON_HAND_1: TBCDField;
    ADODataSet1QUAN_ON_HAND_2: TBCDField;
    ADODataSet1EXPIRE_DATE: TDateTimeField;
    ADODataSet1DescText: TStringField;
    cds735pp_quota_len: TBCDField;
    cds735pp_quota_roll: TFloatField;
    Label_CODE: TLabel;
    Label_REJECT_DESCRIPTION: TLabel;
    edt_EMPL_CODE: TButtonEdit;
    Label_d5_2_EMPLOYEE_NAME: TLabel;
    Label_d5_2_EMPL_CODE: TLabel;
    edt_d5_2_EMPL_CODE: TButtonEdit;
    edt_d5_2_EMPLOYEE_NAME: TEdit;
    edt_CODE: TButtonEdit;
    edt_REJECT_DESCRIPTION: TEdit;
    Label_panel_qty_e: TLabel;
    edt_panel_qty_e: TDBEdit;
    Labe_panel_qty_e1: TLabel;
    edt_panel_qty_e1: TEdit;
    ADODataSet1REF_NUMBER: TStringField;
    cds0730REF_NUMBER: TStringField;
    N1: TMenuItem;
    N_Delete: TMenuItem;
    procedure N_SelectItmeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_OKClick(Sender: TObject);
    procedure edt_panel_qtyKeyPress(Sender: TObject; var Key: Char);
    procedure DghMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure bt_CancelClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure edt_pp_quota_lenChange(Sender: TObject);
  private

    { Private declarations }
  public
    r_RollSum,r_LenSum:Currency;
    procedure CurrSum();
    procedure proc_edt_panel_qtyChange(Sender: TObject);
    { Public declarations }
  end;

var
  PpCutting_1_frm: TPpCutting_1_frm;
  CutType:Integer;          //0正常切割，1损耗切割,全局变量
  const cds730_str_Filter=' QUAN_ON_HAND_1 > 0 ';
  


implementation
               // SelectItemUnit,
uses PpCutting,PublicFile, PpCutting3_unt, PpCutting4_unt;

{$R *.dfm}

procedure TPpCutting_1_frm.CurrSum();
var
  TempCds:TClientDataSet;
begin   //合计当前已领用数量米。
  r_RollSum:=0;
  r_LenSum :=0;
  try
    TempCds:=TClientDataSet.Create(Application);
    TempCds.Data:=cds735.Data;
    if  TempCds.IsEmpty=False then
    begin
      while  not TempCds.Eof do                      
      begin
        r_LenSum   :=r_LenSum + TempCds.FieldByName('pp_quota_len').AsCurrency;
        r_RollSum  :=r_RollSum+ TempCds.FieldByName('pp_quota_roll').AsCurrency;
        TempCds.Next;
      end;       
    end;
  finally
    TempCds.Free;
  end;
end;

procedure TPpCutting_1_frm.N_SelectItmeClick(Sender: TObject);
var
  PpCutting4_frm: TPpCutting4_frm;
begin
  inherited;
  if edt_panel_qty.Text='' then
  begin
    MsgError('“PP切割总张数”不能为空');
    Exit;
  end;

  if Assigned(PpCutting4_frm)=False then
    PpCutting4_frm:= TPpCutting4_frm.Create(Application);
  
  if  PpCutting4_frm.ShowModal=mrOK then
  begin
    if cds0730.IsEmpty=False then
    begin
      cds735.Append;
      cds735.FieldByName('rkey730').Value             := cds0730.FieldByName('RKEY').Value;
      cds735.FieldByName('SUPPLIER2').Value           := cds0730.FieldByName('SUPPLIER2').Value;
      cds735.FieldByName('BARCODE_ID').Value          := cds0730.FieldByName('BARCODE_ID').Value;
      cds735.FieldByName('ABBR_NAME').Value           := cds0730.FieldByName('ABBR_NAME').Value;
      cds735.FieldByName('QUANTITY').Value            := cds0730.FieldByName('QUANTITY').Value;
      cds735.FieldByName('QUAN_ON_HAND_1').Value      := cds0730.FieldByName('QUAN_ON_HAND_1').Value;
      cds735.FieldByName('QUAN_ON_HAND_2').Value      := cds0730.FieldByName('QUAN_ON_HAND_2').Value;
      cds735.FieldByName('EXPIRE_DATE').Value         := cds0730.FieldByName('EXPIRE_DATE').Value;
      cds735.FieldByName('IES_PARAMETER_VALUE2').Value:= cds0730.FieldByName('IES_PARAMETER_VALUE2').Value;
      cds735.FieldByName('IES_PARAMETER_VALUE3').Value:= cds0730.FieldByName('IES_PARAMETER_VALUE3').Value;
    end;
    //PP配额切割总长度(米)>当前已领用数量米+可用数量(卷)
    CurrSum  ;
    if StrToFloat(edt_pp_quota_len.Text) >=
       r_LenSum + cds735.FieldByName('QUAN_ON_HAND_2').Value-2  then
      begin
        if  cds735.State<>dsInsert then  cds735.Edit;
        cds735.FieldByName('pp_quota_len').Value  := cds735.FieldByName('QUAN_ON_HAND_2').Value-2 ;
        cds735.FieldByName('pp_quota_Roll').Value := cds735.FieldByName('QUAN_ON_HAND_1').Value  
          -Round((2/cds735.FieldByName('IES_PARAMETER_VALUE3').Value )*10000)/10000 ;
        cds735.Post;
        
        cds0730.Edit;
        cds0730.FieldByName('QUAN_ON_HAND_1').Value:=0;
        cds0730.FieldByName('QUAN_ON_HAND_2').Value:=0;
        cds0730.Post;
      end
    else
    if StrToFloat(edt_pp_quota_len.Text) <
       r_LenSum + cds735.FieldByName('QUAN_ON_HAND_2').Value-2  then
      begin
        if  cds735.State<>dsInsert then
        cds735.Edit;
        cds735.FieldByName('pp_quota_len').Value:= StrToFloat(edt_pp_quota_len.Text) - r_LenSum;
        cds735.FieldByName('pp_quota_Roll').Value:=
         Round( cds735.FieldByName('pp_quota_len').Value/cds735.FieldByName('IES_PARAMETER_VALUE3').Value*10000)/10000;
        //StrToCurr(edt_pp_quota_roll.Text) - r_RollSum;
        cds735.Post;

        cds0730.Edit;
        cds0730.FieldByName('QUAN_ON_HAND_1').Value := cds0730.FieldByName('QUAN_ON_HAND_1').Value - cds735.FieldByName('pp_quota_Roll').Value;
        cds0730.FieldByName('QUAN_ON_HAND_2').Value := cds0730.FieldByName('QUAN_ON_HAND_2').Value - cds735.FieldByName('pp_quota_len').Value;
        cds0730.Post;
      end;
  end;
end;

procedure TPpCutting_1_frm.FormShow(Sender: TObject);
begin
  inherited;
  edt_panel_qty.SetFocus;
  cds0730.Filtered:=False;
  cds0730.Filter:='QUAN_ON_HAND_1>0';
  cds0730.Filtered:=True;
end;

procedure TPpCutting_1_frm.bt_OKClick(Sender: TObject);
begin
  inherited;
  if edt_panel_qty.ReadOnly=False then
  if (edt_panel_qty.Text='')or(StrToInt(edt_panel_qty.Text)<=0) then
  begin
    MsgError('“PP切割总张数”必须大于0。');
    Exit;
  end  ;

  if (edt_EMPL_CODE.F_rkey='') then
  begin
    MsgError('“切割人员”不能为空。');
    Exit;
  end;

  if CutType=1 then
  begin
    if edt_d5_2_EMPL_CODE.F_rkey='' then
    begin
      MsgError('“损坏责任人代码”不能为空。');
      Exit;
    end;
    if edt_CODE.F_rkey='' then
    begin
      MsgError('“损坏代码”不能为空。');
      Exit;
    end;
  end;

  CurrSum   ;
  if StrToFloat( FloatToStr( r_LenSum)) > StrToFloat(edt_pp_quota_len.Text) then
  begin
    MsgError('耗用长度不能大于实际配额长度。');
    Exit;
  end
  else
  if  StrToFloat( FloatToStr( r_LenSum)) < StrToFloat(edt_pp_quota_len.Text) then   // PpCutting_frm.cdsMain.FieldByName('pp_quota_len').Value
  begin
    MsgError('耗用长度不能小于实际配额长度。');
    Exit;
  end  ;

  ModalResult:=mrOk;
end;

procedure TPpCutting_1_frm.proc_edt_panel_qtyChange(Sender: TObject);
var
  i,i_panel_qty:Integer;
begin
  //panel_ln//长度(纬向)
  if (edt_panel_qty.Text<>'') then
  begin                                   
    i_panel_qty:= Ceil(PpCutting_frm.cdsMain.FieldByName('panel_qty').Value*i_PPC_CONTROL2/100
     -PpCutting_frm.cdsMain.FieldByName('panel_qty_e').Value
    ) ;
    if i_panel_qty=1 then
    i_panel_qty:=2;//设置为最少切割2张
    if StrToInt(edt_panel_qty.Text)  >  i_panel_qty then       //如果超出了损耗比例，提示并退出。
    begin
      MsgError('当前的损耗比例是:'+intToStr(i_PPC_CONTROL2)+'%，不能超出损耗'+intToStr(i_panel_qty)+'张。');
        edt_panel_qty.Text:=intToStr(i_panel_qty)
    end;

    i:=strToFloat(cds0017.FieldByName('IES_PARAMETER_VALUE2').Value) * 25.4/PpCutting_frm.cdsMainpanel_ln.AsVariant;
    //一剪出几PNL =IES_PARAMETER_VALUE2/PNL纬向
   // PP的张数/一剪出几PNL *(PNL经向+0.5MM)/1000  =需要消耗的米数
    edt_pp_quota_len.Text :=
    FloatToStr(
    Ceil(StrToInt(edt_panel_qty.Text)/ i) * (PpCutting_frm.cdsMain.FieldByName('panel_wd').Value + 0.5)/1000
    );

    edt_pp_quota_roll.Text:=CurrToStr(
    Ceil(StrToCurr(edt_pp_quota_len.Text)*10000/(cds0017.FieldByName('IES_PARAMETER_VALUE3').Value-2))/10000 //每卷要损耗2米
    );
  end
  else
  begin
    edt_pp_quota_len.Text:='';
    edt_pp_quota_roll.Text:='';
  end;
end;

procedure TPpCutting_1_frm.edt_panel_qtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',#8]) then  //判断是否输入数字
  Abort;
end;
//1英寸=25.4MM
procedure TPpCutting_1_frm.DghMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end;

  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if   DataSet is TClientDataSet then
      showmessage((DataSet as  TClientDataSet).CommandText)  ;
  end;
end;

procedure TPpCutting_1_frm.PopupMenu1Popup(Sender: TObject);
var
  r:Real ;
begin
  inherited;
  if Trim(edt_panel_qty.Text)='' then
  begin
    MsgError('“PP切割总张数”不能为空。');
    edt_panel_qty.SetFocus;
    Abort;
  end;
  
  r:=    StrToCurr(edt_pp_quota_len.Text)  ;
  CurrSum();
  //ShowMessage(FloatToStr(r_LenSum)+':'+FloatToStr(r));
  if StrToInt( FloatToStr(r*100000)) > StrToInt( FloatToStr( r_LenSum*100000)) then   //浮点比较大小怎是容易出错，放大后转成整型比较
    N_SelectItme.Enabled:=True
  else
    N_SelectItme.Enabled:=False;

  N_Delete.Enabled:=cds735.RecordCount>0;
end;

procedure TPpCutting_1_frm.bt_CancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TPpCutting_1_frm.N_DeleteClick(Sender: TObject);
begin
  inherited;
  with  cds0730  do
  begin
    cds0730.Filtered:=False;

    if Locate('rkey',cds735rkey730.AsInteger,[]) then
    begin
      Edit;
      FieldByName('QUAN_ON_HAND_1').Value:= FieldByName('QUAN_ON_HAND_1').OldValue;
      FieldByName('QUAN_ON_HAND_2').Value:= FieldByName('QUAN_ON_HAND_2').OldValue;
      Post;


      cds735.Delete;
    end;
    cds0730.Filtered:=True;
  end;   
end;

procedure TPpCutting_1_frm.edt_pp_quota_lenChange(Sender: TObject);
begin
  inherited;
  if cds735.Active then
  cds735.CancelUpdates ;//如果更改了切割数量，如果有选择了材料，全部取消。
end;

end.
