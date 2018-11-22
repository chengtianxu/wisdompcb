unit BugFrm_Mod36;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RzEdit, RzBtnEdt, uBaseEditFrm,
  uRKeyBtnEdit, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,uCommFunc,
  Vcl.Buttons,uBaseSinglePickListFrm;

type
  TFrmBug_Mod36 = class(TfrmBaseEdit)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    RzButtonEdit1: TRzButtonEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    Frkey76,Freject_description,FQUAN_IN_INSP,FQUAN_SCRAPPED,FQUAN_TO_BE_SHIPPED,Fsongjiao :string;
    { Public declarations }
  end;

var
  FrmBug_Mod36: TFrmBug_Mod36;

implementation

{$R *.dfm}

procedure TFrmBug_Mod36.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmBug_Mod36.btnSaveClick(Sender: TObject);
var
  Lflag:Double;
begin
  inherited;
  if ((Edit1.Text = '') or (strtofloat(Edit1.Text) <= 0.0)) then
  begin
    messagedlg('请输入数量!',mtinformation,[mbok],0);
    Edit1.Text:='0';
    Edit1.SetFocus;
    Exit;
  end;
  if  (trim(RzButtonEdit1.Text) = '') then
  begin
    messagedlg('请输入缺陷编号！',mtinformation,[mbok],0);
    RzButtonEdit1.SetFocus;
    Exit;
  end;
  if StrToFloat(FQUAN_IN_INSP)- StrToFloat(FQUAN_SCRAPPED)-
  StrToFloat(FQUAN_TO_BE_SHIPPED)- StrToFloat(Fsongjiao)- StrToFloat(Edit1.Text) < 0 then
  begin
    Lflag :=  StrToFloat(FQUAN_IN_INSP)- StrToFloat(FQUAN_SCRAPPED)-
    StrToFloat(FQUAN_TO_BE_SHIPPED)- StrToFloat(Fsongjiao);
    messagedlg('可使用数量最多为'+floattostr(Lflag),mtinformation,[mbok],0) ;
    Edit1.Text := '0';
    Edit1.SetFocus;
    Abort;
  end;

  modalresult:=mrok;
end;

procedure TFrmBug_Mod36.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(key,['0'..'9','.',#8,#13]) then abort//判断是否输入数字
  else
  if key = chr(46) then
  if pos('.',edit1.Text)>0 then abort;//第二列小数点'.'不能重复
end;

procedure TFrmBug_Mod36.RzButtonEdit1ButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(36,2);
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

procedure TFrmBug_Mod36.RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0 ;
end;

end.
