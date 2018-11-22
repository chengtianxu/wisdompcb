unit QueryPick_DemandShop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCache, ppClass, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppPrnabl, DB, Grids,
  DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TQueryPick_Demand = class(TForm)
    Panel1: TPanel;
    BitEsc: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Eh1: TDBGridEh;
    Label2: TLabel;
    Edit1: TEdit;
    procedure BitEscClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
   // PreColumn1: TColumnEh;field_name,
    // startSQL: string;
     PreColumn: TColumnEh;
     field_name: string;
  public
    { Public declarations }
  end;

var
  QueryPick_Demand: TQueryPick_Demand;

implementation

uses Query_DM,MyClass,common, Query_BOM;

{$R *.dfm}

procedure TQueryPick_Demand.BitEscClick(Sender: TObject);
begin
    Close;
end;

procedure TQueryPick_Demand.FormCreate(Sender: TObject);
begin
  { startSQL := DM.qry1.SQL.Text;
  //  ShowMessage(startSQL);

    DM.qry1.Close;
   // DM.qry1.SQL.Clear;
    DM.qry1.SQL.Text := startSQL + ' where data0492.rkey in '+ Query_term.Label6.Caption +' and  data0140.rkey in '+ Query_term.Label7.Caption +' group by dbo.Data0017.INV_PART_NUMBER,dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION' ;
      // ShowMessage(SQL.Text);
    DM.qry1.Open;}

end;

procedure TQueryPick_Demand.Edit1Change(Sender: TObject);
var
  i: Integer;
begin
   Eh1.DataSource.DataSet.Filtered := True;
    if Eh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then Exit;
    if Eh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger] then
     begin
        if trim(Edit1.text) <> '' then
          begin
            if Eh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
              begin
                Eh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(Edit1.text) + '%'')' ;
              end;
           { else
              if Eh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
              begin
                 Eh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(Edit1.text,0))+')';
              end; }
          end
        else
          Eh1.DataSource.DataSet.Filter := '';
     end;
     DM.qry1.DisableControls ;
     DM.qry1.First;
     for i:=0 to DM.qry1.RecordCount -1 do
       begin
         DM.qry1.Next;
       end;
     DM.qry1.EnableControls;  

end;

procedure TQueryPick_Demand.Eh1TitleClick(Column: TColumnEh);
begin
  {if Eh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry1.Sort:=Column.FieldName+' DESC';
  end;

  if Eh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label2.Caption := column.Title.Caption ;
    label2.Left := Edit1.Left - label2.Width - 5;
    field_name := column.FieldName ;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end
  else
    Edit1.SetFocus; }
  if (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qry1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qry1.Sort:=Column.FieldName+' DESC';
  end;

  if (field_name <> column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    label2.Caption := column.Title.Caption ;
    label2.Left := Edit1.Left - label2.Width - 10;
    field_name := column.FieldName ;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end
  else
    Edit1.SetFocus;

end;

procedure TQueryPick_Demand.FormShow(Sender: TObject);
//var
//  i: Integer;
begin

     if  (Length(Trim(Query_term.Label6.Caption)) >2 ) and (Length(Trim(Query_term.Label7.Caption)) >2 ) then
       begin
          DM.qry1.Close;
          DM.qry1.SQL.Clear;
          DM.qry1.SQL.Text := 'SELECT '+
                              'dbo.Data0017.INV_PART_NUMBER, '+
                             ' dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,data0017.QUAN_ON_HAND, '+

                              ' sum(dbo.wzcp0492.STD_QTY) as stdqty, ' +
                              ' sum(dbo.wzcp0492.App_QTY) as app_qty, '  +
                              ' sum(dbo.wzcp0492.Con_QTY) as con_qty,'+
                             '  sum(dbo.wzcp0492.QUAN_ASSIGN) as quan_assign '+
                             ' FROM         dbo.wzcp0492 INNER JOIN ' +
                                                   ' dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey INNER JOIN '+
                                                   ' dbo.Data0017 ON dbo.wzcp0492.D017_ptr = dbo.Data0017.RKEY INNER JOIN ' +
                                                   ' dbo.WZCP0495 ON dbo.wzcp0492.WZCP0495_PTR = dbo.WZCP0495.rkey INNER JOIN ' +
                                                   ' dbo.WZCP0494 ON dbo.WZCP0495.PARTBOM_PTR = dbo.WZCP0494.rkey INNER JOIN '+
                                                   ' dbo.Data0008 ON dbo.WZCP0494.part_ptr = dbo.Data0008.RKEY ' +
                             ' where (1=1)'
                             + ' and data0492.rkey in '+ Query_term.Label6.Caption +' and  WZCP0494.rkey in '+ Query_term.Label7.Caption +
                            ' group by dbo.Data0017.INV_PART_NUMBER,dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,data0017.QUAN_ON_HAND' ;
          DM.qry1.Open;
          DM.qry1.First;
       end                                    
     else
       begin
         DM.qry1.Close;
         DM.qry1.SQL.Clear;
         DM.qry1.SQL.Text := 'SELECT '+
                              'dbo.Data0017.INV_PART_NUMBER, '+
                             ' dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,data0017.QUAN_ON_HAND, '+

                              ' sum(dbo.wzcp0492.STD_QTY) as stdqty, ' +
                              ' sum(dbo.wzcp0492.App_QTY) as app_qty, '  +
                              ' sum(dbo.wzcp0492.Con_QTY) as con_qty,'+
                             '  sum(dbo.wzcp0492.QUAN_ASSIGN) as quan_assign '+
                             ' FROM         dbo.wzcp0492 INNER JOIN ' +
                                                   ' dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey INNER JOIN '+
                                                   ' dbo.Data0017 ON dbo.wzcp0492.D017_ptr = dbo.Data0017.RKEY INNER JOIN ' +
                                                   ' dbo.WZCP0495 ON dbo.wzcp0492.WZCP0495_PTR = dbo.WZCP0495.rkey INNER JOIN ' +
                                                   ' dbo.WZCP0494 ON dbo.WZCP0495.PARTBOM_PTR = dbo.WZCP0494.rkey INNER JOIN '+
                                                   ' dbo.Data0008 ON dbo.WZCP0494.part_ptr = dbo.Data0008.RKEY ' +
                             ' where (1=1)'
                             + ' and data0492.rkey in ' + Query_term.Label6.Caption +
                              '  group by dbo.Data0017.INV_PART_NUMBER,dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,data0017.QUAN_ON_HAND' ;

         DM.qry1.Open;
         DM.qry1.First;
       end;


         field_name := Eh1.Columns[0].FieldName;
         PreColumn := Eh1.Columns[0];
         DM.qry1.Sort:=PreColumn.FieldName;
         Label2.Caption := Eh1.Columns[0].Title.Caption;
         DM.qry1.First;

end;

procedure TQueryPick_Demand.BitBtn3Click(Sender: TObject);
begin
     DM.qry1.Close;
     DM.qry1.Prepared;
     DM.qry1.Open;
     DM.qry1.Sort := PreColumn.FieldName;
end;

procedure TQueryPick_Demand.BitBtn4Click(Sender: TObject);
begin
     common.Export_dbGridEH_to_Excel(Eh1,'BOM×ÜÐèÇó');
end;

end.
