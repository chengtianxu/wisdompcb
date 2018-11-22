unit EditFrm_mod25;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Grids, Vcl.Samples.Spin,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient,SelUserFrm_mod25, System.DateUtils,
  Vcl.Menus,uBaseEditFrm,uCommFunc, Data.Win.ADODB;

type

  TfrmEdit_mod25 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    sg362: TStringGrid;
    eh363: TDBGridEh;
    lbl1: TLabel;
    lbl2: TLabel;
    edt_BCode: TRKeyRzBtnEdit;
    edt_BName: TRKeyRzBtnEdit;
    se_BYear: TSpinEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    ds362: TDataSource;
    ds363: TDataSource;
    cds362: TClientDataSet;
    cds363: TClientDataSet;
    pm363: TPopupMenu;
    mniAdd: TMenuItem;
    mniDel: TMenuItem;
    qrytemp: TADOQuery;
    qrytempRKEY: TAutoIncField;
    qrytempCODE: TStringField;
    qrytempDESCRIPTION: TStringField;
    intgrfld_year: TIntegerField;
    intgrfldGL_PTR: TIntegerField;
    qrytempBUDGET_PERIOD_1: TFloatField;
    qrytempBUDGET_PERIOD_2: TFloatField;
    qrytempBUDGET_PERIOD_3: TFloatField;
    qrytempBUDGET_PERIOD_4: TFloatField;
    qrytempBUDGET_PERIOD_5: TFloatField;
    qrytempBUDGET_PERIOD_6: TFloatField;
    qrytempBUDGET_PERIOD_7: TFloatField;
    qrytempBUDGET_PERIOD_8: TFloatField;
    qrytempBUDGET_PERIOD_9: TFloatField;
    qrytempBUDGET_PERIOD_10: TFloatField;
    qrytempBUDGET_PERIOD_11: TFloatField;
    qrytempBUDGET_PERIOD_12: TFloatField;
    qrytempBUDGET_PERIOD_13: TFloatField;
    qrytempUSED_PERIOD_1: TFloatField;
    qrytempUSED_PERIOD_2: TFloatField;
    qrytempUSED_PERIOD_3: TFloatField;
    qrytempUSED_PERIOD_4: TFloatField;
    qrytempUSED_PERIOD_5: TFloatField;
    qrytempUSED_PERIOD_6: TFloatField;
    qrytempUSED_PERIOD_7: TFloatField;
    qrytempUSED_PERIOD_8: TFloatField;
    qrytempUSED_PERIOD_9: TFloatField;
    qrytempUSED_PERIOD_10: TFloatField;
    qrytempUSED_PERIOD_11: TFloatField;
    qrytempUSED_PERIOD_12: TFloatField;
    qrytempUSED_PERIOD_13: TFloatField;
    procedure mniAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure sg362DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure sg362Exit(Sender: TObject);
    procedure sg362KeyPress(Sender: TObject; var Key: Char);
    procedure sg362SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure mniDelClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    FEditType: Integer;
    procedure GetUser(AFrm: TFrmSelUser_mod25);
    procedure GetData(ARkey:string);
  end;

var
  frmEdit_mod25: TfrmEdit_mod25;

implementation

{$R *.dfm}

{ TfrmEdit_mod25 }



procedure TfrmEdit_mod25.btnCloseClick(Sender: TObject);
begin
  inherited;
 close;
end;

procedure TfrmEdit_mod25.btnSaveClick(Sender: TObject);
var
LPostData:OleVariant;
i:integer;
Lcds362_Save,Lcds363_Save :TClientDataSet;
Lsql362,Lsql363:string;
begin
  inherited;

 if Trim(edt_BCode.text)='' then
 begin
  ShowMessage('编码不能为空！');
  edt_BCode.SetFocus;
  exit;
 end;

 if Trim(edt_BName.text)='' then
 begin
  ShowMessage('编码不能为空！');
  edt_BName.SetFocus;
  exit;
 end;

 if cds363.IsEmpty  then
 begin
 ShowMessage('请选择对应的需求人员！');
 Exit;
 end;

 Lcds362_Save:= TClientDataSet.Create(nil);
 Lcds363_Save:= TClientDataSet.Create(nil);

  try
     if FEditType=3 then
      begin
      Lsql362:='select * From data0362 where 1=2';
      Lsql363:='select * From data0363 where 1=2';
      if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql362, Lsql363]), [Lcds362_Save, Lcds363_Save]) then exit;

        Lcds362_Save.append;
        Lcds362_Save.FieldByName('IDKEy').Value := gFunc.CreateIDKey;
        Lcds362_Save.FieldByName('bud_year').Value :=se_BYear.Value;
        Lcds362_Save.FieldByName('code').Value :=trim(edt_BCode.Text);
        Lcds362_Save.FieldByName('DESCRIPTION').Value :=trim(edt_BName.Text);
         for i := 1 to 12 do
         Lcds362_Save.Fieldbyname('BUDGET_PERIOD_'+inttostr(i)).AsString := sg362.Cells[1,i];
        Lcds362_Save.Post;

        cds363.DisableControls;
        cds363.first;
        while not  cds363.Eof do
        begin
        Lcds363_Save.append;
        Lcds363_Save.FieldByName('d362_IDKey').Value:=Lcds362_Save.FieldByName('IDKey').Value;
         Lcds363_Save.FieldByName('USER_PTR').Value:=cds363.FieldByName('USER_PTR').Value;
        Lcds363_Save.Post;
        cds363.Next;
        end;

        LPostData := varArrayCreate([0, 1], varVariant);
        LPostData[0] := Lcds362_Save.Delta;
        LPostData[1] := Lcds363_Save.Delta;

          if gSvrIntf.IntfPostModData('公共基础', 25, LPostData,1) then
          begin
            Lcds362_Save.MergeChangeLog;
            Lcds363_Save.MergeChangeLog;
            showmessage('保存成功');
            self.ModalResult:=mrok;
           end;
      end
     else
     begin

        cds362.edit;

        if FEditType =1 then
        cds362.FieldByName('IDKEy').Value := gFunc.CreateIDKey;

        cds362.FieldByName('bud_year').value:=se_BYear.Value;
        for i := 1 to 12 do
         cds362.Fieldbyname('BUDGET_PERIOD_'+inttostr(i)).AsString := sg362.Cells[1,i];
         cds362.Post;

        cds363.DisableControls;
        cds363.first;
        while not  cds363.Eof do
        begin
        cds363.Edit;
        cds363.FieldByName('d362_IDKey').Value:=cds362.FieldByName('IDKey').Value;
        cds363.Post;
        cds363.Next;
        end;



      LPostData := varArrayCreate([0, 1], varVariant);
      if cds362.ChangeCount > 0 then
        LPostData[0] := cds362.Delta;
      if cds363.ChangeCount > 0 then
        LPostData[1] := cds363.Delta;


      if gSvrIntf.IntfPostModData('公共基础', 25, LPostData,1) then
      begin
        cds362.MergeChangeLog;
        cds363.MergeChangeLog;
         if FEditType=3 then
         begin
          Lcds362_Save.MergeChangeLog;
          Lcds363_Save.MergeChangeLog;
         end;
        showmessage('保存成功');

       self.ModalResult:=mrok;

      end;


   end;

  finally
    cds363.EnableControls;
    Lcds362_Save.Free;
    Lcds363_Save.Free;
  end;
end;

procedure TfrmEdit_mod25.FormShow(Sender: TObject);
begin
  inherited;
 sg362.Cells[0,0] := '月份';
 sg362.Cells[1,0] := '限额';
 sg362.Cells[2,0] := '已被使用';

 sg362.Cells[0,1] := '1 月份';
 sg362.Cells[0,2] := '2 月份';
 sg362.Cells[0,3] := '3 月份';
 sg362.Cells[0,4] := '4 月份';
 sg362.Cells[0,5] := '5 月份';
 sg362.Cells[0,6] := '6 月份';
 sg362.Cells[0,7] := '7 月份';
 sg362.Cells[0,8] := '8 月份';
 sg362.Cells[0,9] := '9 月份';
 sg362.Cells[0,10] := '10月份';
 sg362.Cells[0,11] := '11月份';
 sg362.Cells[0,12] := '12月份';

 se_BYear.Value:= yearof(gFunc.GetSvrDateTime);
end;

procedure TfrmEdit_mod25.GetData(ARkey: string);
var
  Lsql362,Lsql363: string;
begin

  Lsql362 := 'select * from data0362 where rkey = ' + ARkey;
  Lsql363 :='SELECT  Data0363.* , Data0073.USER_FULL_NAME, Data0073.USER_LOGIN_NAME '+
          ' FROM  Data0363     '+
          ' INNER JOIN  Data0073 ON Data0363.USER_PTR = Data0073.RKEY  '+
          ' where data0363.BUDGET_PTR= '+ ARkey;

  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql362, Lsql363]), [cds362, cds363]) then
    exit;

end;

procedure TfrmEdit_mod25.GetUser(AFrm: TFrmSelUser_mod25);
begin

 AFrm.cdsPick.Filtered:=false;
 AFrm.cdsPick.Filter:='  IsSelected=1';
 AFrm.cdsPick.Filtered:=True;

 if  AFrm.cdsPick.IsEmpty then exit;

 AFrm.cdsPick.first;
 while not AFrm.cdsPick.eof do
 begin
 cds363.Append;
 cds363.FieldByName('USER_PTR').Value:=AFrm.cdsPick.FieldByName('rkey').Value;
 cds363.FieldByName('USER_LOGIN_NAME').Value:=AFrm.cdsPick.FieldByName('USER_LOGIN_NAME').Value;
 cds363.FieldByName('USER_FULL_NAME').Value:=AFrm.cdsPick.FieldByName('USER_FULL_NAME').Value;
 cds363.Post;
 AFrm.cdsPick.Next;
 end;
end;

procedure TfrmEdit_mod25.mniAddClick(Sender: TObject);
var
Lfrm:  TFrmSelUser_mod25;
Ls,LUserStr:string;
begin
  inherited;

    Ls := '';
  if not cds363.IsEmpty  then
  begin
    cds363.First;
    while not cds363.Eof do
    begin
      Ls := Ls + cds363.FieldByName('USER_PTR').AsString + ',';
      cds363.Next;
    end;
  end;

  if Ls = '' then
    LUserStr := ''
  else
    LUserStr := ' and rkey not in ' + '(' + Ls + '-1)';

  // if Lfrm = nil then
  LFrm:=TFrmSelUser_mod25.Create(self);

  try
  Lfrm.FParentCallBack:=GetUser;
  Lfrm.InitWithPickID(25, 0, LUserStr);
  Lfrm.ShowModal;
  finally
   Lfrm.Free;
  end;

end;

procedure TfrmEdit_mod25.mniDelClick(Sender: TObject);
begin
  inherited;

 if  cds363.isempty  then exit;

 cds363.delete;

end;

procedure TfrmEdit_mod25.sg362DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  inherited;
if (acol>1) and (arow>0) then
 begin
  sg362.Canvas.Brush.Color :=clAqua;
  sg362.Canvas.FillRect(rect);
 end;

//IF Acol>0 then
// sg362.Canvas.TextRect(rect,rect.right-sg362.Canvas.TextWidth(sg362.Cells[acol,arow])-2,rect.Top+2,sg362.Cells[acol,aRow]);

end;

procedure TfrmEdit_mod25.sg362Exit(Sender: TObject);
var
 i:byte;
begin
inherited;
 if sg362.Cells[1,sg362.Row]='' then
  sg362.Cells[1,sg362.Row]:='0';

 sg362.Cells[1,sg362.Row]:=
  formatfloat('0.00',strtofloat(sg362.Cells[1,sg362.Row]));

 for i := sg362.Row+1 to 12 do
  IF strtofloat(sg362.Cells[1,i])=0 then
   sg362.Cells[1,i]:=sg362.Cells[1,sg362.Row];
 if strtofloat(sg362.Cells[1,sg362.Row])<strtofloat(sg362.Cells[2,sg362.Row]) then
  begin
   Messagedlg('预算限额不能小于已被使使用金额!',mtinformation,[mbok],0);
   sg362.SetFocus;
  end;
end;

procedure TfrmEdit_mod25.sg362KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if not (key in ['0'..'9','.',#8,#13]) then abort//判断是否输入数字

 else
 if key = chr(46) then
 if pos('.',sg362.Cells[1,sg362.row])>0then abort;
end;

procedure TfrmEdit_mod25.sg362SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var
 i:byte;
begin
inherited;
 if sg362.Cells[1,sg362.Row]='' then
  sg362.Cells[1,sg362.Row]:='0';

 sg362.Cells[1,sg362.Row]:=
  formatfloat('0.00',strtofloat(sg362.Cells[1,sg362.Row]));

 for i := sg362.Row+1 to 12 do
  IF strtofloat(sg362.Cells[1,i])=0 then
   sg362.Cells[1,i]:=sg362.Cells[1,sg362.Row];

 if strtofloat(sg362.Cells[1,sg362.Row]) < strtofloat(sg362.Cells[2,sg362.Row]) then
  begin
   Messagedlg('预算限额不能小于已被使使用金额!',mtinformation,[mbok],0);
   canselect := false;
  end;

 if acol=1 then
   sg362.Options:=sg362.Options+[goEditing]
 else
   sg362.Options:=sg362.Options-[goEditing];

end;

end.
