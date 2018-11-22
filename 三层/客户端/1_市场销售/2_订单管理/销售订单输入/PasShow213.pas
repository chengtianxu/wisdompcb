unit PasShow213;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Buttons, Data.DB,
  Datasnap.DBClient;

type
  TfrmShow213 = class(TfrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    ds213: TDataSource;
    cds213: TClientDataSet;
    CheckBox1: TCheckBox;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(sWhere:string);
  end;

var
  frmShow213: TfrmShow213;

implementation

{$R *.dfm}

{ TfrmShow213 }

procedure TfrmShow213.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  if cds213.RecordCount = 0 then
    ModalResult := mrCancel
  else
    ModalResult := mrok;
end;

procedure TfrmShow213.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    Label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
   edit1.SetFocus;
end;

procedure TfrmShow213.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    cds213.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
  else
    cds213.filter := '';
end;

procedure TfrmShow213.FormShow(Sender: TObject);
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
end;

procedure TfrmShow213.GetData(sWhere:string);
var LSQL213:string;
begin
  LSQL213 :=cds213.CommandText+sWhere;
  gSvrIntf.IntfGetDataBySql(LSQL213,cds213);
end;

end.
