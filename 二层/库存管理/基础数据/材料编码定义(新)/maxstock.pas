unit maxstock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  Tfrm_maxstock = class(TForm)
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    ADO17: TADOQuery;
    ADOQuery1: TADOQuery;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BtnExportToExcel: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure ADO17BeforeDelete(DataSet: TDataSet);
    procedure ADO17BeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    PreColumn: TColumnEh;
    { Private declarations }
  public
    cbindex : Integer;
    { Public declarations }
  end;

var
  frm_maxstock: Tfrm_maxstock;

implementation

uses damo,common;

{$R *.dfm}

procedure Tfrm_maxstock.BitBtn1Click(Sender: TObject);
begin

  ADO17.UpdateBatch(arAll);
  ModalResult := mrOk;
end;

procedure Tfrm_maxstock.ADO17BeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tfrm_maxstock.ADO17BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tfrm_maxstock.FormShow(Sender: TObject);
begin

  if cbindex= 1 then
  begin

    with ADOQuery1 do
    begin
      Close;
      SQL.Text := 'update data0017 set REPORT_VALUE2 = #a17.quan_or'+
      ' from #a17 inner join data0017 on #a17.INVT_PTR = dbo.Data0017.RKEY ';
      ExecSQL;
    end;
    ADO17.Close;
    ADO17.SQL.Text :='select data0017.inv_part_number as ''材料编码'',Data0017.INV_NAME as ''材料名称'','+
                     ' Data0017.INV_PART_DESCRIPTION as ''材料描述'',a17.quan_or as ''月采购量'',data0017.REPORT_VALUE2 as ''最高库存'''+
                     'from #a17 as a17 inner join data0017 on a17.INVT_PTR = dbo.Data0017.RKEY order by data0017.inv_part_number';
  end
  else if cbindex= 0 then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Text := 'update data0017 set REPORT_VALUE2 = #a017.quantit '+
                  ' from #a017 inner join data0017 on #a017.INVENTORY_PTR = dbo.Data0017.RKEY ';
      ExecSQL;
    end;
    ADO17.Close;
    ADO17.SQL.Text :='select data0017.inv_part_number as ''材料编码'',Data0017.INV_NAME as ''材料名称'','+
                     'Data0017.INV_PART_DESCRIPTION as ''材料描述'',#a017.quantit as ''月平均消耗量'',data0017.REPORT_VALUE2  as ''最高库存'''+
                     ' from #a017 inner join data0017 on #a017.INVENTORY_PTR = dbo.Data0017.RKEY order by data0017.inv_part_number';
  end;

  ADO17.Open;
  DBGridEh1.Columns[0].ReadOnly := True;
  DBGridEh1.Columns[1].ReadOnly := True;
  DBGridEh1.Columns[2].ReadOnly := True;
  DBGridEh1.Columns[3].ReadOnly := True;
  DBGridEh1.Columns[0].Width := 180;
  DBGridEh1.Columns[1].Width := 150;
  DBGridEh1.Columns[2].Width := 210;
  DBGridEh1.Columns[3].Width := 80;
  DBGridEh1.Columns[4].Width := 80;

  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clRed;
  DBGridEh1.Columns[0].Title.SortMarker := smUpEh;
end;

procedure Tfrm_maxstock.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADO17.SQL.Text);
end;

procedure Tfrm_maxstock.BtnExportToExcelClick(Sender: TObject);
begin
  if not ADO17.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure Tfrm_maxstock.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin

      if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
      begin
        column.Title.SortMarker:=smUpEh;
        Ado17.Sort:=Column.FieldName;
      end
      else
      begin
        column.Title.SortMarker:=smDownEh;
        Ado17.Sort:=Column.FieldName+' DESC';
      end;



    if PreColumn.FieldName <> column.FieldName then
    begin
      PreColumn.Title.Color := clBtnFace ;
      Column.Title.Color := clred ;
      PreColumn := column ;
    end
  end;
end;

end.
