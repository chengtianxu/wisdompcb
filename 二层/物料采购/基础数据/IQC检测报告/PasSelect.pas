unit PasSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGridEh;

type
  TfrmSelect = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    dbSelect: TDBGridEh;
    adoSelect: TADODataSet;
    DataSource1: TDataSource;
    lbFilter: TLabel;
    edtFilter: TEdit;
    procedure FormShow(Sender: TObject);
    procedure adoSelectBeforeDelete(DataSet: TDataSet);
    procedure adoSelectBeforeInsert(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure dbSelectTitleClick(Column: TColumnEh);
  private
    preColumn:TColumnEh;
    { Private declarations }
  public
    SelectType:Integer;     //0表示选择类型   1表示选择供应商
    { Public declarations }
  end;

var
  frmSelect: TfrmSelect;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmSelect.FormShow(Sender: TObject);
begin

  if adoSelect.Active=False then
  begin
    adoSelect.Close;
    if SelectType = 0 then
    begin
      adoSelect.CommandText:= 'declare @select table(isSelect bit)  '+ #13+
                    '  insert into @select values(0) ' + #13+
                    '  select isSelect,group_name as 类型编码,group_desc as 类型名,rkey '+ #13+
                    '  from data0496 join @select on 0=0 '  + #13+
                    '  where rkey not in(select rkey496 from data0395)';
    end
    else
    begin
      adoSelect.CommandText:= ' declare @select table(isSelect bit) ' + #13+
                    ' insert into @select values(0) ' + #13+
                    ' select isSelect,code as 供应商代码,ABBR_NAME as 供应商简称,rkey' + #13+
                    ' from data0023 join @select on 0=0 ';
    end;
    adoSelect.Open;
  end;
  preColumn:=dbSelect.Columns[1];
  lbFilter.Caption:= preColumn.Title.Caption;
  dbSelect.Columns[3].Width:=0;
  edtFilter.Text:='';
  adoSelect.Filter:='';
end;

procedure TfrmSelect.adoSelectBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmSelect.adoSelectBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TfrmSelect.btnSaveClick(Sender: TObject);
begin
  adoSelect.Filtered:=False;
  adoSelect.Filter:='isSelect=1';
  adoSelect.Filtered:=True;

  if adoSelect.RecordCount=0 then
  begin
    if SelectType = 0 then ShowMessage('请先选择材料类型')
    else ShowMessage('请先选择供应商');
    adoSelect.Filter:='';
    Exit;
  end;
  ModalResult:=mrYes;
end;

procedure TfrmSelect.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    adoSelect.Filtered:=False;
    adoSelect.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
    adoSelect.Filtered:=True;
  end
  else
  begin
    adoSelect.Filter:='';
  end;
end;

procedure TfrmSelect.dbSelectTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker= smUpEh then
   begin
    Column.Title.SortMarker:=smDownEh;
    adoSelect.IndexFieldNames:=Column.FieldName + ' DESC';
   end
  else
   begin
    Column.Title.SortMarker:=smUpEh;
    adoSelect.IndexFieldNames:=Column.FieldName;
   end;

  if (Column.Title.Caption<>preColumn.Title.Caption) and
      (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    edtFilter.Text:='';
    preColumn:=Column;
  end;
end;

end.
