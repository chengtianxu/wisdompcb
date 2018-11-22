unit u_infohistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, ExtCtrls;

type
  Tfrm_infohistory = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Sqltext: string;
  public
    { Public declarations }
  end;

var
  frm_infohistory: Tfrm_infohistory;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_infohistory.Button1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_infohistory.DBGridEh1TitleClick(Column: TColumnEh);
begin
    //if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated
   // then  exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      DM.ADOQuery4.Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      DM.ADOQuery4.Sort:=Column.FieldName+' DESC';
    end;
 //   if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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

procedure Tfrm_infohistory.FormShow(Sender: TObject);
begin
  dm.ADOQuery4.Active := true;
  field_name := DBGridEh1.Columns[1].FieldName;
  PreColumn := DBGridEh1.Columns[1];
  DBGridEh1.Columns[1].Title.Color := clred ;
  label2.caption := inttostr(dm.ADOQuery4.RecordCount);

end;

procedure Tfrm_infohistory.Edit1Change(Sender: TObject);
begin
   //   if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
   //   if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    //  begin
      if trim(Edit1.text) <> '' then 
     // if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
    else
      DBGridEh1.DataSource.DataSet.Filter:='';
  //    end;
      label2.caption := inttostr(dm.ADOQuery4.RecordCount);
end;

end.
