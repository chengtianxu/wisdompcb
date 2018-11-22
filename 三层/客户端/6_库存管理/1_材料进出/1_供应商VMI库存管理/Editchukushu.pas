unit Editchukushu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TfrmEditchukushu = class(TfrmBaseEdit)
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    cds134: TClientDataSet;
    cds149: TClientDataSet;
    procedure btnSaveClick(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure inti;
  end;

var
  frmEditchukushu: TfrmEditchukushu;

implementation

{$R *.dfm}

procedure TfrmEditchukushu.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEditchukushu.btnSaveClick(Sender: TObject);
var Lcds:TClientDataSet;
    LSql49,LSql34: string;
    LPostData: OleVariant;
begin
  inherited;
  if (Trim(Edit3.Text)='') then
  begin
    ShowMessage('请输入退仓数量');
    Edit3.SetFocus;
    Exit;
  end;
  Lcds:=TClientDataSet.Create(Self);
  try
    gSvrIntf.IntfGetDataBySql('select quantity,rtn_quantity from data0149 where rkey= ' + IntToStr(Edit1.Tag)+'',Lcds);
    if not Lcds.IsEmpty then
    begin
      if (StrToFloat(Edit2.Text)<>Lcds.FieldByName('quantity').AsFloat) or (StrToFloat(Label6.Caption)<>Lcds.FieldByName('rtn_quantity').AsFloat)  then
      begin
        showmessage('已有人正在操作,请稍后再试!');
        exit;
      end;
    end;
    // data0149
    LSql49 := 'select * from data0149 where rkey = ' + IntToStr(Edit1.Tag);
    // data0134
    LSql34 := 'select * from data0134 where Rkey = ' + IntToStr(Edit2.Tag);
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql49,LSql34]),[cds149,cds134]) then Exit;
    //edit134
    if not cds134.IsEmpty then
    begin
      cds134.Edit;
      cds134.FieldByName('QUAN_ON_HAND').Value:=StrToFloat(edit5.Text)+StrToFloat(Label6.Caption)-StrTOFloat(Edit3.Text);
      cds134.Post;
    end;
    //edit0149
    if not cds149.IsEmpty then
    begin
      cds149.Edit;
      cds149.FieldByName('rtn_quantity').Value:=StrTOFloat(Edit3.Text);
      if (Trim(Edit4.Text)='') then Edit4.Text:='0';
      cds149.FieldByName('tax_price').Value:=StrTOFloat(Edit4.Text);
      cds149.Post;
    end;
    if cds149.State in [dsEdit,dsInsert] then cds149.Post;
    if cds134.State in [dsEdit,dsInsert] then cds134.Post;

    LPostData := VarArrayCreate([0,1],varVariant);
    if cds149.ChangeCount > 0 then
      LPostData[0] := cds149.Delta;
    if cds134.ChangeCount > 0 then
      LPostData[1] := cds134.Delta;
    if gSvrIntf.IntfPostModData('公共基础',564,LPostData,3) then
    begin
      if cds149.ChangeCount > 0 then cds149.MergeChangeLog;
      if cds134.ChangeCount > 0 then cds134.MergeChangeLog;
      ShowMessage('修改成功');
      ModalResult:=mrOk;
    end;
  finally
    Lcds.Free;
  end;
end;

procedure TfrmEditchukushu.Edit3Exit(Sender: TObject);
begin
  inherited;
  if trim(Edit3.Text) = '' then  Edit3.Text := '0';
  if strtofloat(Edit3.Text) >(StrToFloat(Label6.Caption)+strtofloat(Edit5.Text)) then
  begin
    messagedlg('修改数量不能大于当前可用数量!',mterror,[mbcancel],0);
    Edit3.SetFocus;
  end
  else Edit3.Text := formatfloat('0.000',strtofloat(Edit3.Text));
end;

procedure TfrmEditchukushu.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(Key, ['0'..'9','.',#8,#13])) then  //判断是否输入数字
  abort
  else
  if (pos('.',Edit3.Text)>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
end;

procedure TfrmEditchukushu.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (CharInSet(Key,['0'..'9','.',#8,#13])) then  //判断是否输入数字
  abort
  else
  if (pos('.',Edit4.Text)>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
end;

procedure TfrmEditchukushu.inti;
begin
end;

end.
