unit PasDModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MyClass,Buttons, ExtCtrls;

type
  TfrmDModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    chbEff: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNO: TEdit;
    edtName: TEdit;
    edtFloor: TEdit;
    Memo1: TMemo;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtFloorKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    mc:TMyDataClass;
    { Private declarations }
  public
    status:Integer;
    rkey:string;
    { Public declarations }
  end;

var
  frmDModify: TfrmDModify;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmDModify.btnSaveClick(Sender: TObject);
var
  i:Integer;
  strsql:string;
begin
  for i:=0 to Panel2.ControlCount-1 do
  begin
    if (Panel2.Controls[i] is TEdit) and ((Panel2.Controls[i] as TEdit).Text='') then
    begin
      ShowMessage((Panel2.Controls[i] as TEdit).Hint+' 不能为空');
      (Panel2.Controls[i] as TEdit).SetFocus;
      Exit;
    end;
  end;
  if status=1 then
  begin
    strsql:='select rkey,D_code from dormitorymsg where D_code='+ QuotedStr(Trim(edtNO.Text));
    if mc.OpenQuery(DM.adotmp,strsql) then
    begin
      if not DM.adotmp.IsEmpty then
      begin
        ShowMessage('宿舍楼编号'+ Trim(edtNO.Text)+ '已经存在');
        edtNO.SetFocus;
        Exit;
      end;
    end;
    strsql:='insert into dormitorymsg(D_code, D_name, D_floor, remark, effective)'+
            ' values('+ QuotedStr(Trim(edtNO.Text)) + ',' + QuotedStr(Trim(edtName.Text)) +
            ',' + Trim(edtFloor.Text)+ ','+ QuotedStr(Trim(Memo1.Lines.Text))+
            ',' + QuotedStr(BoolToStr(chbEff.Checked,True)) +')';

    try
      mc.ExecSql(strsql);
      strsql:='select rkey,D_code from dormitorymsg where D_code='+ QuotedStr(Trim(edtNO.Text));
      if mc.OpenQuery(DM.adotmp,strsql) then
      begin
        if not DM.adotmp.IsEmpty then
            rkey:=DM.adotmp.FieldByName('rkey').AsString;
      end;
      ModalResult:=mrYes;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;

  if status=2 then
  begin
    strsql:='update dormitorymsg set effective='+ QuotedStr(BoolToStr(chbEff.Checked,True))+
            ',D_code='+ QuotedStr(Trim(edtNO.Text))+ ',D_name='+ QuotedStr(Trim(edtName.Text))+
            ',D_floor='+ Trim(edtFloor.Text)+',remark='+ QuotedStr(Trim(Memo1.Lines.Text))+ #13+
            'where rkey='+ DM.adoDormitoryrkey.AsString;
    try
      mc.ExecSql(strsql);
      ModalResult:=mrYes;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

procedure TfrmDModify.FormCreate(Sender: TObject);
begin
  mc:=TMyDataClass.Create(DM.ADOConnection1);
end;

procedure TfrmDModify.FormDestroy(Sender: TObject);
begin
  mc.Free;
end;

procedure TfrmDModify.edtFloorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then Abort;
end;

procedure TfrmDModify.FormShow(Sender: TObject);
begin
  frmDModify.Caption:='新增';
  if (status=2) or (status=3) then
  begin
    frmDModify.Caption:='编辑';
    if DM.adoDormitoryeffective.Value then chbEff.Checked:=True
    else chbEff.Checked:=False;
    edtNO.Text:=DM.adoDormitoryD_code.Value;
    edtName.Text:=DM.adoDormitoryD_name.Value;
    edtFloor.Text:=DM.adoDormitoryD_floor.AsString;
    Memo1.Lines.Text:=DM.adoDormitoryremark.Value;
    edtNO.Enabled:=False;
    if status=3 then
    begin
      frmDModify.Caption:='检查';
      btnSave.Enabled:=False;
      Panel2.Enabled:=False;
    end;
  end;
end;

end.
