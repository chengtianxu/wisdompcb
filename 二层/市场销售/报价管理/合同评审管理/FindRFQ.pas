unit FindRFQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, Buttons, ComCtrls,DB,ADODB,
  DBGrids;

type
  TfrmFindRFQ = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtRFQNo: TEdit;
    Label1: TLabel;
    sbtnRefresh: TSpeedButton;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure edtRFQNoChange(Sender: TObject);
    procedure sbtnRefreshClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     PreColumn: TColumnEh;
  public
    { Public declarations }
  end;

var
  frmFindRFQ: TfrmFindRFQ;

implementation

uses damo,common, Detail;

{$R *.dfm}

procedure TfrmFindRFQ.edtRFQNoChange(Sender: TObject);
begin
   with TADOQuery(DBGrideh1.DataSource.DataSet) do
   IF Active  THEN
      if trim(edtRFQNo.text) <> '' then
          Filter := PreColumn.FieldName+' like ''%'+trim(edtRFQNo.text)+'%'''
      else
          Filter := '' ;
//  if trim(edtRFQNo.Text)<>'' then
//  begin
//    DM.dsFindRFQ.:=PreColumn.FieldName+' like ''%'+trim(edtRFQNo.Text)+'%''';
//  end
// else
//  begin
//    DM.dsFindRFQ.Filter:='';
//  end;
end;

procedure TfrmFindRFQ.sbtnRefreshClick(Sender: TObject);
begin
  with dm.aqFindRFQ do
  begin
    Close;
    Parameters.Items[0].Value:= frmDetail.DBEdit4.Text;
    Parameters.Items[1].Value:= frmDetail.DBEdit4.Text;
    Open;
    if edtRFQNo.Text <> '' then
      Filter:= ' RFQNo like ' +''+'%'+edtRFQNo.Text+'%'+''
    else
      Filter:= '';
  end;
end;

procedure TfrmFindRFQ.DBGridEh1DblClick(Sender: TObject);
begin
//  if dm.aqFindRFQ.RecordCount = 0 then
//    ModalResult := mrCancel
//  else
//    ModalResult := mrok;
   modalresult:=mrok;

end;

procedure TfrmFindRFQ.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if PreColumn.FieldName<>column.FieldName then
      begin
        label1.Caption := column.Title.Caption;
        edtRFQNo.Text := '' ;
        edtRFQNo.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
      end
 else
      begin
        edtRFQNo.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
      end;
end;

procedure TfrmFindRFQ.FormShow(Sender: TObject);
begin
  PreColumn := DBGrideh1.Columns[1] ;
  PreColumn.Title.Color := clred;
  label1.Caption := PreColumn.Title.Caption;
end;

end.
