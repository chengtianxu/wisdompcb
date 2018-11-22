unit USelBOMMtrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, ImgList, DB, ADODB, StdCtrls, Buttons, Grids,
  DBGridEh, ExtCtrls, ComCtrls;

type
  TfrmSelMtrls = class(TForm)
    spl1: TSplitter;
    tv1: TTreeView;
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl_Count: TLabel;
    edt_Value: TEdit;
    eh17: TDBGridEh;
    btn_OK: TBitBtn;
    btn_Cancel: TBitBtn;
    qry17: TADOQuery;
    ds17: TDataSource;
    il17: TImageList;
    qrytemp: TADOQuery;
    qry17RKEY: TIntegerField;
    qry17INV_PART_NUMBER: TStringField;
    qry17INV_NAME: TStringField;
    qry17INV_DESCRIPTION: TStringField;
    qry17QUAN_ON_HAND: TBCDField;
    qry17std_cost: TFloatField;
    qry17STOP_PURCH: TStringField;
    qry17unit_name: TStringField;
    qry17FisMAt: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure eh17TitleClick(Column: TColumnEh);
    procedure edt_ValueChange(Sender: TObject);
    procedure tv1Click(Sender: TObject);
    procedure eh17DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     PreColumn: TColumnEh;
     FfilterStr:string;
     procedure TVInit;
  end;

var
  frmSelMtrls: TfrmSelMtrls;

implementation

uses DM_u;

{$R *.dfm}

procedure TfrmSelMtrls.FormShow(Sender: TObject);
begin
  PreColumn:=eh17.Columns[0];
 //tv1Click(tv1.Selected) ;
end;

procedure TfrmSelMtrls.eh17TitleClick(Column: TColumnEh);
begin
if eh17.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (PreColumn.FieldName <> column.FieldName) then
  begin
    lbl1.Caption := column.Title.Caption ;
   // PreColumn.FieldName := column.FieldName ;
    edt_Value.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_ValueChange(edt_Value);
  end
  else
    edt_Value.SetFocus;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry17.Sort:=Column.FieldName;
  end
  else
  begin
   column.Title.SortMarker:=smDownEh;
   qry17.Sort:=Column.FieldName+' DESC';
  end;

end;

procedure TfrmSelMtrls.edt_ValueChange(Sender: TObject);
begin
//
  if eh17.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_Value.text) <> '' then
    begin
      if eh17.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in  [ftString, ftWideString]  then
        eh17.DataSource.DataSet.Filter:=' (' +  PreColumn.FieldName + ' like ''%' + trim(edt_Value.text) + '%'')'
      else if eh17.DataSource.DataSet.FieldByName(PreColumn.FieldName).DataType in  [ftSmallint, ftInteger]  then
        eh17.DataSource.DataSet.Filter:=' (' + PreColumn.FieldName+' >= ' + inttostr(strtointdef(edt_Value.text,0))+')';
    end else
      eh17.DataSource.DataSet.Filter:='';
  end;
  lbl_count.Caption := '当前显示数目：' + IntToStr(eh17.DataSource.DataSet.RecordCount);

end;

procedure TfrmSelMtrls.TVInit;
var node1,node2,node3,node4:TTreeNode;
    Frkey19:^integer;
 Lsql:string;
begin
  PreColumn := eh17.Columns[0];
  eh17.Columns[0].Title.Color := clred ;
  node1:=tv1.Items.AddChild(nil,'所有原材料');
 
  node1.SelectedIndex:=0;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select * from data0019  ';   
  DM.Tmp.Open;
  while not DM.Tmp.Eof do
  begin
    new(Frkey19);
    Frkey19^:=DM.Tmp.Fields[0].AsInteger;
    node3:=tv1.Items.AddChildObject(node1,DM.Tmp.Fields[1].asstring+' '+DM.Tmp.Fields[2].asstring,Frkey19);
    node3.SelectedIndex:=1;
    DM.Tmp1.Close;
    DM.Tmp1.SQL.Text:='SELECT RKEY, GROUP_NAME, GROUP_DESC FROM Data0496 where GROUP_PTR='+DM.Tmp.Fields[0].AsString+' order by 2';
    DM.Tmp1.Open;
    while not DM.Tmp1.eof do
    begin
      new(Frkey19);
      Frkey19^:=DM.Tmp1.Fields[0].AsInteger;
      node4:=tv1.Items.AddChildObject(node3,DM.Tmp1.Fields[1].asstring+' '+DM.Tmp1.Fields[2].asstring,Frkey19);
      node4.SelectedIndex:=1;
      DM.Tmp1.Next;
    end;
    DM.Tmp.Next;
  end;


  if qry17.Active then qry17.Active := false;
   Lsql:='SELECT d17.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION,STOP_PURCH,'+
    ' (QUAN_ON_HAND-QUAN_ASSIGN) QUAN_ON_HAND,std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 as FisMAt '+
    ' FROM dbo.Data0017 d17 '+
    ' inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey ' +
    ' where   d17.STOP_PURCH=''N'' and d17.rkey not in '+FfilterStr+ 
    ' order by 2';
   qry17.SQL.Text:=  Lsql;
   qry17.Open;

end;

procedure TfrmSelMtrls.tv1Click(Sender: TObject);
var s:string;
Lsql:string;
begin

  if tv1.Selected=nil then exit;

  if qry17.Active  then qry17.Close;

  if tv1.Selected.Text='所有原材料' then  
   begin
    qry17.SQL.Clear;

    Lsql:='SELECT d17.RKEY, INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION,STOP_PURCH,'+
    ' (QUAN_ON_HAND-QUAN_ASSIGN) QUAN_ON_HAND,std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 as FisMAt '+
    ' FROM dbo.Data0017 d17 inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey ' +
    ' where   d17.STOP_PURCH=''N'' and d17.rkey not in '+FfilterStr+
    ' order by 2';
    qry17.SQL.Text:=Lsql;
    qry17.Open;

   lbl_count.Caption := IntToStr(qry17.RecordCount);
   end
   else
   if tv1.Selected.Level=1 then
   begin
    Lsql:='SELECT d17.RKEY, d17.INV_PART_NUMBER, d17.INV_NAME, d17.INV_DESCRIPTION, (d17.QUAN_ON_HAND-d17.QUAN_ASSIGN) QUAN_ON_HAND,d17.STOP_PURCH,'+
          ' d17.std_cost,d02.unit_name,CRITICAL_MATL_FLAG,0 FisMAt '+
          ' FROM dbo.Data0017 d17 '+
          ' inner join data0496 d496 on d17.group_ptr=d496.rkey '+
          ' inner join data0019 d19 on d496.group_ptr=d19.rkey '+
          ' inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey  '+
          ' where  d17.STOP_PURCH=''N''  and d19.rkey='+inttostr(integer(tv1.Selected.data^))+
          ' and d17.rkey not in '+FfilterStr+
           ' order by 2';
    qry17.SQL.Text:=Lsql;
    qry17.Open;
    eh17.DataSource.DataSet := qry17;
    lbl_count.Caption := IntToStr(qry17.RecordCount);
   end
  else
  if tv1.Selected.Level=2 then
  begin
   Lsql:='SELECT d17.RKEY, d17.INV_PART_NUMBER, d17.INV_NAME, d17.INV_DESCRIPTION, (d17.QUAN_ON_HAND-d17.QUAN_ASSIGN) QUAN_ON_HAND,'+
          ' d17.STOP_PURCH,d17.std_cost,d02.unit_name, CRITICAL_MATL_FLAG,0 FisMAt'+
          ' FROM dbo.Data0017 d17 '+
          ' inner join data0496 d496 on d17.group_ptr=d496.rkey '+
          ' inner join data0002 d02 on d17.STOCK_UNIT_PTR=d02.rkey '+
          ' where  d17.STOP_PURCH=''N'' and d496.rkey='+inttostr(integer(tv1.Selected.data^))+
          ' and d17.rkey not in '+FfilterStr+ 
          ' order by 2';
    qry17.SQL.Text:=Lsql;
    qry17.Open;
    eh17.DataSource.DataSet := qry17;
    lbl_count.Caption := IntToStr(qry17.RecordCount);
  end ;
  edt_Value.Text:='';

end;

procedure TfrmSelMtrls.eh17DblClick(Sender: TObject);
begin
 if not qry17.isempty then  self.ModalResult:=mrOk;
end;

end.
