unit Single;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, ExtCtrls, DB, ADODB;

type
  TForm_Single = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
    sing:Byte;
  end;

var
  Form_Single: TForm_Single;

implementation

uses dmo;

{$R *.dfm}

procedure TForm_Single.FormCreate(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TForm_Single.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADOemployeemsg.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADOemployeemsg.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn:=Column;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TForm_Single.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADOemployeemsg.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADOemployeemsg.Filter:='';
end;

procedure TForm_Single.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm_Single.Button2Click(Sender: TObject);
begin
  DM.ADOemployeemsg.Filter:='';
  Close;
end;

procedure TForm_Single.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
