unit ufrmadmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons;

type
  Tfrmadmin = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh2Enter(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    nowdate : string;
    activedb : Integer;
  public
    { Public declarations }
  end;

var
  frmadmin: Tfrmadmin;

implementation

uses UDM,common;

{$R *.dfm}

procedure Tfrmadmin.FormResize(Sender: TObject);
begin
 pnl2.Width := Trunc(Self.Width * 0.5);
end;

procedure Tfrmadmin.Button1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmadmin.BitBtn4Click(Sender: TObject);
begin
    Export_dbGridEH_to_Excel(DBGridEh1,'经理级合同_'+nowdate) ;
end;

procedure Tfrmadmin.BitBtn1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh2,'总监级合同_'+nowdate) ;
end;

procedure Tfrmadmin.FormShow(Sender: TObject);
begin
  activedb := 1;
  nowdate:= FormatDateTime('yyyy-MM-dd',Now);
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
end;

procedure Tfrmadmin.DBGridEh1TitleClick(Column: TColumnEh);
begin
 //if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.employee_contract_5.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_contract_5.Sort:=Column.FieldName+' DESC';
  end;


   if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        label1.Caption:=column.Title.Caption;
        self.field_name:=column.FieldName;
        edit1.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
  end
  else
      edit1.SetFocus;

end;

procedure Tfrmadmin.DBGridEh2TitleClick(Column: TColumnEh);
begin
 //if DBGridEh2.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.employee_contract_6.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.employee_contract_6.Sort:=Column.FieldName+' DESC';
  end;

   if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
        label1.Caption:=column.Title.Caption;
        self.field_name:=column.FieldName;
        edit1.SetFocus;
        PreColumn.Title.Color := clBtnFace;
        Column.Title.Color := clred;
        PreColumn := column;
  end
  else
      edit1.SetFocus;
end;

procedure Tfrmadmin.Edit1Change(Sender: TObject);
begin
  //if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if activedb = 1 then
  begin
      if trim(Edit1.text) <> '' then
      begin
          DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      end else
        DBGridEh1.DataSource.DataSet.Filter:='';

  end;

    if activedb = 2 then
  begin

      if trim(Edit1.text) <> '' then
      begin
          DBGridEh2.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')' 
      end else
        DBGridEh2.DataSource.DataSet.Filter:='';   
  end;


end;

procedure Tfrmadmin.DBGridEh1Enter(Sender: TObject);
begin
  activedb:=1;
end;

procedure Tfrmadmin.DBGridEh2Enter(Sender: TObject);
begin
  activedb:=2;
end;

end.
