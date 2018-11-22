unit StaffList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TForm_StaffList = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOEmployeeMsg: TADODataSet;
    DataSource1: TDataSource;
    ADOEmployeeMsgrkey: TAutoIncField;
    ADOEmployeeMsgemployeecode: TWideStringField;
    ADOEmployeeMsgchinesename: TWideStringField;
    ADOEmployeeMsgondutytime: TDateTimeField;
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_StaffList: TForm_StaffList;

implementation

uses dmo;

{$R *.dfm}

procedure TForm_StaffList.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_StaffList.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TForm_StaffList.Button1Click(Sender: TObject);
begin
  DBGridEh1DblClick(Sender);
end;

procedure TForm_StaffList.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADOEmployeeMsg.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADOEmployeeMsg.Filter:='';
end;

procedure TForm_StaffList.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    ADOEmployeeMsg.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    ADOEmployeeMsg.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    if Column.Title.Caption<>'入职日期' then
    begin
      Label1.Caption:=Column.Title.Caption;
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
    end
    else
      preColumn.Title.Color:=clBtnFace;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TForm_StaffList.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TForm_StaffList.BitBtn1Click(Sender: TObject);
begin
  ADOEmployeeMsg.Close;
  ADOEmployeeMsg.Open;
  Edit1.Text:='';
  Edit1.SetFocus;
end;

end.
