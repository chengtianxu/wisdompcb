unit PasDesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGridEh, Menus;

type
  TfrmDesign = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnClose: TBitBtn;
    dbType: TDBGridEh;
    adoDesign: TADODataSet;
    DataSource1: TDataSource;
    adoDesignrkey496: TIntegerField;
    adoDesignreportname_c: TWideStringField;
    adoDesigngroup_name: TStringField;
    adoDesigngroup_desc: TStringField;
    PopupMenu1: TPopupMenu;
    nAdd: TMenuItem;
    nDelete: TMenuItem;
    lbFilter: TLabel;
    edtFilter: TEdit;
    procedure FormShow(Sender: TObject);
    procedure nAddClick(Sender: TObject);
    procedure dbTypeTitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure nDeleteClick(Sender: TObject);
  private
    preColumn:TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesign: TfrmDesign;

implementation

uses DAMO, PasTypeAdd;

{$R *.dfm}

procedure TfrmDesign.FormShow(Sender: TObject);
begin
  adoDesign.Close;
  adoDesign.Open;
  preColumn:=dbType.Columns[0];
end;

procedure TfrmDesign.nAddClick(Sender: TObject);
begin
  try
    frmTypeAdd:=TfrmTypeAdd.Create(application);
    if frmTypeAdd.showModal=mryes then
    begin
      adoDesign.Close;
      adoDesign.Open;
      adoDesign.Locate('rkey496',frmTypeAdd.edtType.Tag,[]);
    end;
  finally
    frmTypeAdd.Free;
  end;
end;

procedure TfrmDesign.dbTypeTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    adoDesign.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    adoDesign.IndexFieldNames:=Column.FieldName;
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

procedure TfrmDesign.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    adoDesign.Filtered:=False;
    adoDesign.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
    adoDesign.Filtered:=True;
  end
  else
  begin
    adoDesign.Filter:='';
  end;
end;

procedure TfrmDesign.nDeleteClick(Sender: TObject);
begin
  if (adoDesignrkey496.value>0) and (MessageDlg('你确定要删除此材料类型绑定的报表吗？',mtWarning,[mbyes,mbno],0)=mryes) then
  begin
    with dm.adotmp do
    begin
      close;
      sql.clear;
      sql.text:='delete data0395 where rkey496='+ inttostr(adoDesignrkey496.value);
      execsql;
    end;
    adoDesign.Close;
    adoDesign.Open;
  end;
end;

end.
