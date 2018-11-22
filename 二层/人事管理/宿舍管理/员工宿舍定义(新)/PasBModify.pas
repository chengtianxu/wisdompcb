unit PasBModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MyClass, Buttons, ExtCtrls;

type
  TfrmBModify = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    chkeff: TCheckBox;
    Label4: TLabel;
    edtRoomNO: TEdit;
    edtRoomName: TEdit;
    edtBedNo: TEdit;
    Memo1: TMemo;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    tmpsql:string;
    BC:TMyDataClass;
    { Private declarations }
  public
    status,rkey:Integer;
    { Public declarations }
  end;

var
  frmBModify: TfrmBModify;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmBModify.btnSaveClick(Sender: TObject);
var
  eff:string;
begin
  if Trim(edtBedNo.Text)='' then
  begin
    ShowMessage('床位编号不能为空');
    edtBedNo.SetFocus;
    Exit;
  end;
  if chkeff.Checked then eff:='1'
  else eff:='0';
  if status=1 then
  begin
    tmpsql:='select rkey from bedmsg where B_code='+ QuotedStr(Trim(edtBedNo.Text));
    BC.OpenQuery(DM.adotmp,tmpsql);
    if not DM.adotmp.IsEmpty then
    begin
      ShowMessage('床位号'+ Trim(edtBedNo.Text)+'已经存在');
      edtBedNo.SetFocus;
      Exit;
    end;
    try
      tmpsql:='insert into bedmsg(bedroomid,B_code,effective,remark) values('+
              IntToStr(edtRoomNO.Tag)+','+ QuotedStr(Trim(edtBedNo.Text))+','+
              eff + ',' + QuotedStr(Trim(Memo1.Lines.Text))+')';
      tmpsql:=tmpsql+#13+ 'update bedroommsg set bedcount=bedcount+1 from bedroommsg where rkey='+ IntToStr(edtRoomNO.Tag);
  //    ShowMessage(tmpsql);
      BC.ExecSql(tmpsql,True);

      tmpsql:='select rkey from bedmsg where B_code='+ QuotedStr(Trim(edtBedNo.Text));
      BC.OpenQuery(DM.adotmp,tmpsql);
      if not DM.adotmp.IsEmpty then
      begin
        rkey:= DM.adotmp.FieldByName('rkey').AsInteger;
      end;
    except
      on E: Exception do
      begin
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
  
  if status=2 then
  begin
    tmpsql:='update bedmsg set   remark='+ QuotedStr(Trim(Memo1.Lines.Text))+',effective='+
            eff+ ',B_code=' + QuotedStr(Trim(edtBedNo.Text))+#13+
            ' from bedmsg where rkey='+ DM.adoBedrkey.AsString;
            // ShowMessage(tmpsql);
    BC.ExecSql(tmpsql);
  end;
  ModalResult:=mrYes;
end;

procedure TfrmBModify.FormCreate(Sender: TObject);
begin
  bc:=TMyDataClass.Create(DM.ADOConnection1);
end;

procedure TfrmBModify.FormDestroy(Sender: TObject);
begin
  BC.Free;
end;

procedure TfrmBModify.FormShow(Sender: TObject);
begin
  if status=1 then
  begin
    frmBModify.Caption:='新增';
    edtRoomNO.Text:=DM.adoRoomR_code.AsString;
    edtRoomName.Text:=DM.adoRoomR_name.AsString;

    edtBedNo.ReadOnly:=false;
  end;
  if (status=2) or (status=3) then
  begin
    frmBModify.Caption:='编辑';
    edtBedNo.Text:=DM.adoBedB_code.AsString;
    Memo1.Lines.Text:=DM.adoBedremark.AsString;
    if DM.adoBedeffective.Value=1 then chkeff.Checked:=True
    else chkeff.Checked:=False;

    edtBedNo.ReadOnly:=false;

    if status=3 then
    begin
      frmBModify.Caption:='检查';
      Panel2.Enabled:=False;
      btnSave.Enabled:=False;
      edtBedNo.ReadOnly:=true;
    end;
  end;
end;

end.
