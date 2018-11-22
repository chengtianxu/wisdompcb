unit UEditDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls;

type
  TfrmAddDetail = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    edt_typename: TEdit;
    edt_typecode: TEdit;
    Edt_filter: TEdit;
    Edit1: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    FFlag: integer;
    fflag1: Integer;
    fflag2: Integer;
  end;

var
  frmAddDetail: TfrmAddDetail;

implementation

uses UDM, Unew;

{$R *.dfm}

procedure TfrmAddDetail.Button1Click(Sender: TObject);
var i:Integer;
begin
    if edt_typename.Text='' then
    begin
      ShowMessage('请输入选项名称!');
      edt_typename.SetFocus;
      Exit;
    end
    else
    if edt_typecode.Text='' then
    begin
      ShowMessage('请输入选项编码!');
      edt_typecode.SetFocus;
      Exit;
    end
    else
    if edt_typecode.Text='' then
    begin
      ShowMessage('请输入选项编码!');
      edt_typecode.SetFocus;
      Exit;
    end ;

  if FFlag=0 then
  begin
     
    DM.qry594.Filtered:=False;
    dm.qry594.Filter:='type_name='''+edt_typename.Text+'''';
    dm.qry594.Filtered:=True;
    if not dm.qry594.IsEmpty  then
    begin
      ShowMessage('选项名称不能重复');
      dm.qry594.Filter:='';
      Exit;

    end;
    dm.qry594.Append;
    if fflag1=1 then
    DM.qry594rkey593.Value:= fflag2;
    dm.qry594type_name.Value:= edt_typename.Text;
    dm.qry594type_code.Value:=edt_typecode.Text;
    DM.qry594filter_name.Value:=Edt_filter.Text;
    DM.qry594rec_no.Value:=Edit1.Tag;
    DM.qry594.Post;
    DM.qry594.Filtered:=False;
    dm.qry594.Filter:='';
    dm.qry594.Filtered:=True;
    edt_typename.Text:='';
    edt_typecode.Text:='';
    Edt_filter.Text:='';
    edt_typename.SetFocus;
    Edit1.Tag:=DM.qry594.RecordCount+1;
  end;

  if FFlag=1 then
  begin
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Text:='select * from data0594 where rkey593='+dm.qry594rkey593.AsString+' and type_name='''+Trim(edt_typename.Text)+'''';
    dm.ADOQuery1.Open;
    if not dm.ADOQuery1.RecordCount>=2 then
    begin
      ShowMessage('选项名称不能重复');
      Exit;
    end;
    dm.qry594.Edit;
    dm.qry594type_name.Value:= edt_typename.Text;
    dm.qry594type_code.Value:=edt_typecode.Text;
    DM.qry594filter_name.Value:=Edt_filter.Text;
    DM.qry594.FieldByName('rec_no').Value:= Edit1.Text;
    DM.qry594.Post;
    ModalResult:= mrOk;
//    DM.qry594.Filtered:=False;
//    dm.qry594.Filter:='';
//    dm.qry594.Filtered:=True;
//    dm.qry594.Locate('type_name',Trim(edt_typename.Text),[]);
//---------------------------------------------
//      begin
//
//
//      i:=1;
//      try
//       dm.con1.BeginTrans;
//        dm.qry594.First;
//       while not dm.qry594 .Eof do
//       begin
//         DM.qry594.Edit;
//         DM.qry594rec_no.Value:=i;
//         DM.qry594.FieldByName('rkey593').Value:=DM.qry594rkey593.Value;
//         DM.qry594.FieldByName('filter_name').Value:=DM.qry594filter_name.Value;
//         DM.qry594.FieldByName('type_name').Value:= dm.qry594type_name.Value;
//         DM.qry594.FieldByName('type_code').Value:=DM.qry594type_code.Value;
//         DM.qry594.Post;
//         i:=i+1;
//         dm.qry594.Next;
//       end;
//
//
//       DM.qry594.UpdateBatch(arall);
//
//       dm.con1.CommitTrans;
//       ModalResult:=mrok
//      except
//       dm.con1.RollbackTrans;
//
//      end;

 //    end;

  end;
end;

procedure TfrmAddDetail.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   begin
     if not (key in ['0'..'9',#13,#8]) then
     key := #0;
  end;
end;

procedure TfrmAddDetail.FormShow(Sender: TObject);
begin
  Edit1.Tag:=DM.qry594.RecordCount+1;
end;

end.
