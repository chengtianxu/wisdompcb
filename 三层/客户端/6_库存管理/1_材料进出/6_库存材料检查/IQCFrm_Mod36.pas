unit IQCFrm_Mod36;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, uBaseEditFrm, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient,uCommFunc, Vcl.Menus,
  Vcl.Grids, DBCtrlsEh, Datasnap.Provider,uBaseSinglePickListFrm;

type
  TAfterUpdate_Mod36 = procedure (ACds:TClientDataSet) of object;

  TFrmIQC_Mod36 = class(TfrmBaseEdit)
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    RKeyRzBtnEdit2: TRKeyRzBtnEdit;
    RKeyRzBtnEdit3: TRKeyRzBtnEdit;
    RKeyRzBtnEdit6: TRKeyRzBtnEdit;
    RKeyRzBtnEdit8: TRKeyRzBtnEdit;
    RKeyRzBtnEdit9: TRKeyRzBtnEdit;
    RKeyRzBtnEdit11: TRKeyRzBtnEdit;
    cds22: TClientDataSet;
    ds22: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Edit1: TEdit;
    cds95: TClientDataSet;
    cds96: TClientDataSet;
    cds17: TClientDataSet;
    DBGridEh1: TDBGridEh;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1handlemethod: TStringField;
    ClientDataSet1quantity: TFloatField;
    ClientDataSet1code: TStringField;
    ClientDataSet1reject_description: TStringField;
    ClientDataSet1rkey76: TIntegerField;
    EdtBFSL: TEdit;
    EdtTHSL: TEdit;
    cds22_2: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure N2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    OldDate:TDateTime;
    OldStore:Integer;
  public
    FAfterUpdate : TAfterUpdate_Mod36;
    procedure getdata(ARKey,AINVENTORY_PTR:string);
    { Public declarations }
  end;

var
  FrmIQC_Mod36: TFrmIQC_Mod36;

implementation

{$R *.dfm}

uses BugFrm_Mod36,System.StrUtils;
{ TFrmIQC_Mod36 }

procedure TFrmIQC_Mod36.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmIQC_Mod36.btnSaveClick(Sender: TObject);
var
  LPostData : OleVariant;
  LSql22 : string;
  LCds22 : TClientDataSet;
  LGetTime : TDateTime;
  LField:TField;
begin
  inherited;
  if cds22.FieldByName('QUAN_IN_INSP').AsFloat <> StrToFloat(EdtTHSL.Text)+strtofloat(EdtBFSL.Text)+strtofloat(edit1.Text) then
  begin
    showmessage('品检数与待检数不等,请注意数量关系...');
    exit;
  end;

  LSql22 := 'select QUAN_IN_INSP from data0022 where QUAN_IN_INSP='+ cds22.FieldByName('QUAN_IN_INSP').AsString+' and rkey = '+ cds22.FieldByName('rkey').AsString;
  LCds22 := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql(LSql22,LCds22);
    if LCds22.IsEmpty then
    begin
      messagedlg('库存已改变，请刷新后再进行退货',mtinformation,[mbok],0);
      Exit;
    end;
  finally
    LCds22.Free;
  end;

  if messagedlg('此过程不可逆,您确定吗?',mtconfirmation,[mbyes,mbno],1) = mrno then exit;

  LGetTime := gFunc.GetSvrDateTime;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin

    if Trim(ClientDataSet1.FieldByName('handlemethod').Value) = '报废' then
    begin
      cds95.Append;
      cds95.FieldByName('TRAN_TP').Value := 9;
//    else
//    begin
//      cds95.FieldByName('TRAN_TP').Value := 8;  //退货
//    end;
      cds95.FieldByName('INVT_PTR').Value := cds22.FieldByName('INVENTORY_PTR').Value;
      cds95.FieldByName('SRCE_PTR').Value := cds22.FieldByName('rkey').Value;
      cds95.FieldByName('TRAN_BY').Value := gVar.rkey05;
      cds95.FieldByName('TRAN_DATE').Value := LGetTime;
      cds95.FieldByName('QUANTITY').Value := ClientDataSet1.FieldByName('QUANTITY').Value;
      cds95.Post;
    end ;
    cds96.Append;
    if Trim(ClientDataSet1.FieldByName('handlemethod').Value) = '报废' then
    begin
      cds96.FieldByName('FLAG').Value := 1;   //报废
    end
    else
    begin
      cds96.FieldByName('FLAG').Value := 2;  //代表是退货给供应商
    end;
    cds96.FieldByName('INVT_PTR').Value := cds22.FieldByName('INVENTORY_PTR').Value;
    cds96.FieldByName('REJ_PTR').Value := ClientDataSet1.FieldByName('rkey76').Value;
    cds96.FieldByName('INV_TRAN_PTR').Value := cds22.FieldByName('rkey').Value;
    cds96.FieldByName('EMPL_PTR').Value := gVar.rkey05;
    cds96.FieldByName('TDATE').Value := LGetTime;
    cds96.FieldByName('QUAN_REJD').Value := ClientDataSet1.FieldByName('quantity').Value;
    cds96.Post;
    ClientDataSet1.Next;
  end;

  if cds22.FieldByName('QUAN_ON_HAND').Value = 0 then
  begin
    cds22.Edit;
    cds22.FieldByName('QUAN_SCRAPPED').Value := cds22.FieldByName('QUAN_SCRAPPED').Value+ strtofloat(EdtBFSL.Text); //报废数
    cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value := cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value+ StrToFloat(EdtTHSL.Text);//退供应商数
    cds22.FieldByName('QUAN_IN_INSP').Value := 0;   //待检数
    cds22.FieldByName('QUAN_ON_HAND').Value := cds22.FieldByName('QUAN_ON_HAND').Value+ strtofloat(Edit1.Text);  //可用数(退仓)
    cds22.Post;
  end
  else
  begin
    cds22_2.Append;
    for LField in cds22_2.Fields do
    begin
      if IndexText(LField.FieldName,['rkey']) <> -1 then Continue;
      if cds22.FindField(LField.FieldName) <> nil then
        LField.Value := cds22.FieldByName(LField.FieldName).Value;
    end;
    cds22_2.FieldByName('QUAN_SCRAPPED').Value := 0; //报废数
    cds22_2.FieldByName('QUAN_TO_BE_SHIPPED').Value := 0;//退供应商数
    cds22_2.FieldByName('QUAN_RTNED_FM_FACT').Value := 0;//退供应商数
    cds22_2.FieldByName('QUAN_IN_INSP').Value := 0;   //待检数
    cds22_2.FieldByName('QUAN_ON_HAND').Value := StrToInt(Trim(Edit1.Text));  //可用数(退仓)
    cds22_2.FieldByName('QUANTITY').Value := cds22_2.FieldByName('QUAN_ON_HAND').Value;
    cds22_2.FieldByName('EXPIRE_DATE').Value:= cds22.FieldByName('EXPIRE_DATE').Value;
    cds22_2.FieldByName('LOCATION_PTR').Value:= cds22.FieldByName('LOCATION_PTR').Value;
    cds22_2.Post;


    cds22.Edit;
    cds22.FieldByName('QUAN_SCRAPPED').Value := cds22.FieldByName('QUAN_SCRAPPED').Value+ strtofloat(EdtBFSL.Text); //报废数
    cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value := cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value+ StrToFloat(EdtTHSL.Text);//退供应商数
    cds22.FieldByName('QUAN_IN_INSP').Value := 0;   //待检数
    cds22.FieldByName('EXPIRE_DATE').Value:= OldDate;
    cds22.FieldByName('LOCATION_PTR').Value:= OldStore;
    cds22.Post;
  end;

  if strtofloat(edit1.Text) > 0 then
  begin
    cds95.append;
    cds95.FieldByName('TRAN_TP').Value := 10;
    cds95.FieldByName('INVT_PTR').Value := cds22.FieldByName('INVENTORY_PTR').Value;
    cds95.FieldByName('SRCE_PTR').Value := cds22.FieldByName('rkey').Value;
    cds95.FieldByName('TRAN_BY').Value := gVar.rkey05;
    cds95.FieldByName('TRAN_DATE').Value := LGetTime;
    cds95.FieldByName('QUANTITY').Value := Edit1.Text;
    cds95.post;

    cds17.edit;
    cds17.FieldByName('QUAN_ON_HAND').Value:=cds17.FieldByName('QUAN_ON_HAND').Value+strtofloat(edit1.Text);
    cds17.post;
  end
  else if strtofloat(edit1.Text) = 0 then
  begin
    cds22.Edit;
    cds22.FieldByName('EXPIRE_DATE').Value:= OldDate;
    cds22.Post;
  end;

  if cds22.State in [dsEdit,dsInsert] then cds22.Post;
  if cds95.State in [dsEdit,dsInsert] then cds95.Post;
  if cds96.State in [dsEdit,dsInsert] then cds96.Post;
  if cds17.State in [dsEdit,dsInsert] then cds17.Post;
  if cds22_2.State in [dsEdit,dsInsert] then cds22_2.Post;

  LPostData := VarArrayCreate([0,4],varVariant);
  if cds22.ChangeCount > 0 then
    LPostData[0] := cds22.Delta;
  if cds95.ChangeCount > 0 then
    LPostData[1] := cds95.Delta;
  if cds96.ChangeCount >0 then
    LPostData[2] := cds96.Delta;
  if cds17.ChangeCount >0 then
    LPostData[3] := cds17.Delta;
  if cds22_2.ChangeCount > 0 then
    LPostData[4] := cds22_2.Delta;
//   ShowMessage(cds22.FieldByName('QUAN_TO_BE_SHIPPED').AsString);
  if gSvrIntf.IntfPostModData('公共基础',36,LPostData) then
  begin
    cds22.MergeChangeLog;
    cds95.MergeChangeLog;
    cds96.MergeChangeLog;
    cds17.MergeChangeLog;
    cds22_2.MergeChangeLog;
    ShowMessage('保存成功');
    if Assigned(FAfterUpdate) then
      FAfterUpdate(nil);
    Close;
  end;
end;

procedure TFrmIQC_Mod36.Edit1Exit(Sender: TObject);
var
  LFlag:Double;
begin
  inherited;
  if  ActiveControl.Name = 'btnClose' then  Exit;

  if  (edit1.Text = '') then
  begin
    messagedlg('请输入送交入仓数量!',mtconfirmation,[mbok],0);
    edit1.Text := '0';
    edit1.SetFocus;
  end
  else
  if (cds22.FieldByName('QUAN_IN_INSP').AsFloat-strtofloat(edit1.Text)-strtofloat(EdtBFSL.Text)
     -strtofloat(EdtTHSL.Text)) < 0 then
  begin
    LFlag := (strtofloat(RKeyRzBtnEdit3.Text)-strtofloat(EdtBFSL.Text)
             -strtofloat(EdtTHSL.Text));
    messagedlg('可使用数量最多为'+floattostr(LFlag),mtconfirmation,[mbok],0);
    Edit1.Text := '0';
    Edit1.SetFocus;
  end ;
end;

procedure TFrmIQC_Mod36.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',edit1.Text) > 0then abort;//第二列小数点'.'不能重复
end;

procedure TFrmIQC_Mod36.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmIQC_Mod36 := nil;
end;

procedure TFrmIQC_Mod36.getdata(ARKey,AINVENTORY_PTR: string);
var
  Lsql22,Lsql95,Lsql96,Lsql17,Lsql22_2:string;
begin
  ClientDataSet1.CreateDataSet;

  lsql22 := 'select * from data0022 where data0022.rkey='+ARkey ;

  Lsql22_2 := 'select * from data0022 where data0022.rkey=0';

  Lsql95 := 'select *  from Data0095 where 1=2';

  Lsql96 :='select * from Data0096 where 1=2';

  Lsql17 :='select *  from Data0017 where rkey='+ AINVENTORY_PTR;

  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql22,Lsql95,Lsql96,Lsql17,Lsql22_2]),[cds22,cds95,cds96,cds17,cds22_2]);

  OldDate:= cds22.FieldByName('EXPIRE_DATE').Value;
  OldStore:= cds22.FieldByName('LOCATION_PTR').Value;
end;

procedure TFrmIQC_Mod36.N1Click(Sender: TObject);
var
  LFrm:TFrmBug_Mod36;
begin
  inherited;
  LFrm := TFrmBug_Mod36.Create(Self);
  try
    LFrm.FQUAN_IN_INSP := cds22.FieldByName('QUAN_IN_INSP').AsString;
    LFrm.FQUAN_SCRAPPED := EdtBFSL.Text;
    LFrm.FQUAN_TO_BE_SHIPPED := EdtTHSL.Text;
    LFrm.Fsongjiao := Edit1.Text;
    if LFrm.ShowModal=mrOk then
    begin
//      ClientDataSet1.First;
//      try
//        ClientDataSet1.DisableControls;
//        while not ClientDataSet1.Eof do
//        begin
//          if (ClientDataSet1.FieldByName('handlemethod').Value=LFrm.RadioGroup1.Items[LFrm.RadioGroup1.ItemIndex])
//           and (ClientDataSet1.FieldByName('code').Value=LFrm.RKeyRzBtnEdit1.Text) then
//          begin
//            ShowMessage('已经有这种类型的记录，请删除原记录后再新增!');
//            exit;
//          end;
//          ClientDataSet1.Next;
//        end;
//      finally
//        ClientDataSet1.EnableControls;
//      end;

      if ClientDataSet1.Locate('handlemethod;code',VarArrayOf
      ([LFrm.RadioGroup1.Items[LFrm.RadioGroup1.ItemIndex],LFrm.RzButtonEdit1.Text]),[loPartialKey]) then
      begin
        ShowMessage('已经有这种类型的记录，请删除原记录后再新增!');
        exit;
      end;
      if LFrm.RadioGroup1.ItemIndex = 0 then
      begin
        EdtBFSL.Text := FloatToStr(StrToFloat(EdtBFSL.Text)+ StrToFloat(LFrm.Edit1.Text));
//        cds22.Edit;
//        cds22.FieldByName('QUAN_SCRAPPED').Value := FloatToStr(cds22.FieldByName('QUAN_SCRAPPED').Value+ StrToFloat(LFrm.Edit1.Text));
//        cds22.Post;
      end
      else
      begin
//        cds22.Edit;
//        cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value := FloatToStr(cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value+ StrToFloat(LFrm.Edit1.Text));
//        cds22.Post;
        EdtTHSL.Text := FloatToStr(StrToFloat(EdtTHSL.Text)+ StrToFloat(LFrm.Edit1.Text));
      end;
      ClientDataSet1.Append;
      ClientDataSet1.FieldByName('handlemethod').Value := LFrm.RadioGroup1.Items[LFrm.RadioGroup1.ItemIndex];
      ClientDataSet1.FieldByName('quantity').Value := LFrm.Edit1.Text;
      ClientDataSet1.FieldByName('code').Value := LFrm.RzButtonEdit1.Text;
      ClientDataSet1.FieldByName('reject_description').Value := LFrm.Freject_description;
      ClientDataSet1.FieldByName('rkey76').Value := LFrm.Frkey76;
      ClientDataSet1.Post;

    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmIQC_Mod36.N2Click(Sender: TObject);
begin
  inherited;
  if messagedlg('确定要删除此记录吗？',mtconfirmation,[mbyes,mbno],0) = mryes then
  begin
    if Trim(ClientDataSet1.FieldByName('handlemethod').AsString) = '报废' then
    begin
       EdtBFSL.Text := floattostr(Strtofloat(EdtBFSL.Text) - ClientDataSet1.FieldByName('quantity').Value);
//      cds22.Edit;
//      cds22.FieldByName('QUAN_SCRAPPED').Value := FloatToStr(cds22.FieldByName('QUAN_SCRAPPED').Value- ClientDataSet1.FieldByName('quantity').Value);
//      cds22.Post;
    end
    else
    begin
      EdtTHSL.Text := floattostr(Strtofloat(EdtTHSL.Text)-ClientDataSet1.FieldByName('quantity').Value);
//        cds22.Edit;
//        cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value := FloatToStr(cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value-ClientDataSet1.FieldByName('quantity').Value);
//        cds22.Post;
    end;
    ClientDataSet1.Delete;

  end;
end;

end.
