unit ReturnFrm_Mod40;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit,uCommFunc, Data.DB,
  Datasnap.DBClient,uBaseSinglePickListFrm;

type
  TAfterUpdate_Mod40 = procedure (ACds:TClientDataSet) of object;

  TFrmReturn_Mod40 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    edtTHSL: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    edtZKSL: TEdit;
    cds17: TClientDataSet;
    cds22: TClientDataSet;
    cds96: TClientDataSet;
    cds209: TClientDataSet;
    cds235: TClientDataSet;
    RzButtonEdit1: TRzButtonEdit;
    procedure edtTHSLKeyPress(Sender: TObject; var Key: Char);
    procedure edtTHSLExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    FModNum:Integer;
    Frkey76,Freject_description,Frkey:string;
    FAfterUpdate : TAfterUpdate_Mod40;
    procedure getdata(ARKey,AINVENTORY_PTR:string);
    { Public declarations }
  end;

var
  FrmReturn_Mod40: TFrmReturn_Mod40;

implementation

{$R *.dfm}

{ TFrmReturn_Mod40 }

procedure TFrmReturn_Mod40.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmReturn_Mod40.btnSaveClick(Sender: TObject);
var
  LPostData : OleVariant;
  Lsql352,Lsql40:string;
  Lcds352,Lcds40:TClientDataSet;
begin
  inherited;
  if strtofloat(edtTHSL.Text) = 0 then
  begin
    messagedlg('退货数量为零!',mtinformation,[mbok],0);
    edtTHSL.SetFocus;
    exit;
  end;
  if Trim(RzButtonEdit1.Text) = '' then
  begin
    messagedlg('拒收代码不能为空!',mtinformation,[mbok],0);
    RzButtonEdit1.SetFocus;
    exit;
  end;
  if FModNum = 352 then
  begin
    Lsql352 := ' select quan_on_hand from data0235 where quan_on_hand ='+ edtZKSL.Text+' and rkey='+ cds235.FieldByName('rkey').AsString;
    Lcds352 := TClientDataSet.Create(nil);
    try
      gSvrIntf.IntfGetDataBySql(Lsql352,Lcds352);
      if Lcds352.IsEmpty then
      begin
        messagedlg('库存已改变，请刷新后再进行退货',mtinformation,[mbok],0);
        Exit;
      end;
    finally
      Lcds352.Free;
    end;
  end
  else
  begin
    Lsql40 := 'select quan_on_hand from data0022 where quan_on_hand='+ edtZKSL.Text+' and rkey = '+ cds22.FieldByName('rkey').AsString;
    Lcds40 := TClientDataSet.Create(nil);
    try
      gSvrIntf.IntfGetDataBySql(Lsql40,Lcds40);
      if Lcds40.IsEmpty then
      begin
        messagedlg('库存已改变，请刷新后再进行退货',mtinformation,[mbok],0);
        Exit;
      end;
    finally
      Lcds40.Free;
    end;
  end;
  if FModNum=352 then
  begin
    cds209.Append;
    cds209.FieldByName('TTYPE').Value := 2; //代表是退货给供应商
    cds209.FieldByName('GL_HDR_PTR').Value := Frkey76;
    cds209.FieldByName('srce_ptr').Value := cds235.FieldByName('rkey').AsString;
    cds209.FieldByName('user_ptr').Value := gVar.rkey73;
    cds209.FieldByName('EMPL_PTR').Value := gVar.rkey05;
    cds209.FieldByName('quantity').Value := edtTHSL.Text;
    cds209.FieldByName('TDATE').Value := gFunc.GetSvrDateTime;
    cds209.FieldByName('PART_PTR').Value := cds235.FieldByName('D0072_PTR').AsString;
    cds209.FieldByName('remark').Value := Memo1.Lines.Text;
    cds209.Post;

    cds235.Edit;
    cds235.FieldByName('quan_on_hand').Value := StrToFloat(edtZKSL.Text) - StrToFloat(edtTHSL.Text);
    cds235.FieldByName('quan_to_ship').Value := cds235.FieldByName('quan_to_ship').Value + StrToFloat(edtTHSL.Text);
    cds235.Post;

    if cds235.State in [dsEdit,dsInsert] then cds235.Post;
    if cds209.State in [dsEdit,dsInsert] then cds209.Post;

    LPostData := VarArrayCreate([0,1],varVariant);
    if cds235.ChangeCount > 0 then
      LPostData[0] := cds235.Delta;
    if cds209.ChangeCount > 0 then
      LPostData[1] := cds209.Delta;

    if gSvrIntf.IntfPostModData('公共基础',40,LPostData,1) then
    begin
      cds235.MergeChangeLog;
      cds209.MergeChangeLog;
      ShowMessage('保存成功');
      if Assigned(FAfterUpdate) then
        FAfterUpdate(nil);
      Close;
    end;
  end
  else
  begin
    cds96.Append;
    cds96.FieldByName('FLAG').Value := 2; //代表是退货给供应商
    cds96.FieldByName('INVT_PTR').Value := cds22.FieldByName('INVENTORY_PTR').Value;
    cds96.FieldByName('REJ_PTR').Value := Frkey76;
    cds96.FieldByName('INV_TRAN_PTR').Value := cds22.FieldByName('rkey').Value;
    cds96.FieldByName('EMPL_PTR').Value := gVar.rkey05;
    cds96.FieldByName('TDATE').Value := gFunc.GetSvrDateTime;
    cds96.FieldByName('QUAN_REJD').Value := edtTHSL.Text;
    cds96.FieldByName('reference_number').Value := Memo1.Lines.Text;
    cds96.Post;

    cds22.Edit;
    cds22.FieldByName('quan_to_be_shipped').Value := cds22.FieldByName('quan_to_be_shipped').Value+ StrToFloat(edtTHSL.Text);
    cds22.FieldByName('quan_on_hand').Value := cds22.FieldByName('quan_on_hand').Value - StrToFloat(edtTHSL.Text);
    cds22.Post;

    cds17.Edit;
    cds17.FieldByName('quan_on_hand').Value := cds17.FieldByName('quan_on_hand').Value - StrToFloat(edtTHSL.Text);
    cds17.Post;

    if cds22.State in [dsEdit,dsInsert] then cds22.Post;
    if cds96.State in [dsEdit,dsInsert] then cds96.Post;
    if cds17.State in [dsEdit,dsInsert] then cds17.Post;

    LPostData := VarArrayCreate([0,2],varVariant);
    if cds22.ChangeCount > 0 then
      LPostData[0] := cds22.Delta;
    if cds96.ChangeCount >0 then
      LPostData[1] := cds96.Delta;
    if cds17.ChangeCount >0 then
      LPostData[2] := cds17.Delta;

    if gSvrIntf.IntfPostModData('公共基础',40,LPostData) then
    begin
      cds22.MergeChangeLog;
      cds96.MergeChangeLog;
      cds17.MergeChangeLog;
      ShowMessage('保存成功');
      if Assigned(FAfterUpdate) then
        FAfterUpdate(nil);
      Close;
    end;
  end;
end;

procedure TFrmReturn_Mod40.edtTHSLExit(Sender: TObject);
begin
  inherited;
  if trim(edtTHSL.Text) = '' then
    edtTHSL.Text := '0.00';
  if (strtofloat(edtTHSL.Text) > strtofloat(edtZKSL.Text)) and
    (activecontrol.Name<>'btnClose') then
    begin
      messagedlg('退还的数量不能大于可用的数量!',mterror,[mbcancel],0);
      edtTHSL.SetFocus;
    end
  else
    edtTHSL.Text := formatfloat('0.00',strtofloat(edtTHSL.Text));
end;

procedure TFrmReturn_Mod40.edtTHSLKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key,['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',edtTHSL.Text)>0then abort;//第二列小数点'.'不能重复
end;

procedure TFrmReturn_Mod40.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmReturn_Mod40 := nil;
end;

procedure TFrmReturn_Mod40.getdata(ARKey,AINVENTORY_PTR: string);
var
  Lsql17,Lsql22,Lsql96,Lsql235,Lsql209:string;
begin
  if FModNum in [40,41] then
  begin
    Lsql17 := ' select QUAN_ON_HAND, RKEY  from Data0017 where rkey='+ AINVENTORY_PTR;
    Lsql22 := ' select * from data0022 where data0022.rkey='+ARkey ;
    Lsql96 := ' select * from data0096 where 1=2';
    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql17,Lsql22,Lsql96]),[cds17,cds22,cds96]);
    edtZKSL.Text := cds22.FieldByName('quan_on_hand').AsString;
  end;
  if FModNum = 352 then
  begin
    Lsql235 := ' select * from data0235 where rkey='+ARkey;
    Lsql209 := ' select * from data0209 where 1=2';
    gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql235,Lsql209]),[cds235,cds209]);
    edtZKSL.Text := cds235.FieldByName('quan_on_hand').AsString;
  end;


end;

procedure TFrmReturn_Mod40.RzButtonEdit1ButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(40,0);
    if LFrm.ShowModal = mrOk then
    begin
      RzButtonEdit1.Text := LFrm.cdsPick.FieldByName('code').AsString;
      Frkey76 := LFrm.cdsPick.FieldByName('rkey').AsString;
      Freject_description := LFrm.cdsPick.FieldByName('REJECT_DESCRIPTION').AsString;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmReturn_Mod40.RzButtonEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := #0;
end;

end.
