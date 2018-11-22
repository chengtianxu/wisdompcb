unit Form_SEE_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus,
  DB,OleServer, Excel2000, ComObj,DBGrids, ADODB, DBClient;

type
  TForm_SEE = class(TForm)
    Panel1: TPanel;
    btnEsc: TBitBtn;
    btnUpdate: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    popupmenu1: TPopupMenu;
    procedure btnEscClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
  private
    { Private declarations }
    procedure item_click(sender: TObject);
  public
    { Public declarations }
    PreColumn: TColumnEh;
     field_name: string;
  end;

var
  Form_SEE: TForm_SEE;

implementation

uses DM_u, Frm_BOM_u,common,MyClass;

{$R *.dfm}

procedure TForm_SEE.item_click(sender: TObject);
  var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TForm_SEE.btnEscClick(Sender: TObject);
begin
    close;

end;

procedure TForm_SEE.BitBtn1Click(Sender: TObject);
begin
     popupmenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm_SEE.FormShow(Sender: TObject);
 var
    i:integer;
    item:TMenuItem;
    INVENT_id : string;
begin
    if Frm_BOM.DBGridEh2.DataSource.DataSet.FieldByName('INVENT_PTR').AsString <> null then
       begin
         INVENT_id :=Frm_BOM.DBGridEh2.DataSource.DataSet.FieldByName('INVENT_PTR').AsString;
         DM.ADO148_detail.Close;
         DM.ADO148_detail.SQL.Clear;
         DM.ADO148_detail.SQL.Text := ' select  Quert_data.seq_no,Quert_data.inv_part_number,Quert_data.inv_name ,Quert_data.INV_DESCRIPTION,0.0 as  QUAN_ISSUED,Quert_data.QUAN_BOM, '+
                                      '	Quert_data.QUAN_ON_HAND,Quert_data.invent_tp,Quert_data.production_teamname,Quert_data.unit_name,Quert_data.STD_COST ,Quert_data.QUAN_BOM*Quert_data.STD_COST TotalCost, '+
                                      '	Quert_data.VENDOR,Quert_data.STOP_PURCH ,Quert_data.part_name,Quert_data.EMPLOYEE_NAME ,Quert_data.auth3_date,Quert_data.EMPLOYEE_NAME,Quert_data.part_ptr,Quert_data.PRODUCT_GROUP_NAME,Quert_data.auth_date,Quert_data.status_c, '+
                                      '	Quert_data.INVENT_PTR from  (SELECT   data0148.seq_no,d17_0.inv_part_number, d17_0.inv_name ,d17_0.INV_DESCRIPTION,0.0 as  QUAN_ISSUED,data0148.QUAN_BOM, '+
                                      ' d17_0.QUAN_ON_HAND,case data0148.invent_or when 0 then ''材料'' else ''半成品'' end invent_tp,data0148.production_teamname,d02.unit_name,data0148.STD_COST ,data0148.QUAN_BOM*data0148.STD_COST TotalCost, '+
                                      '	data0148.VENDOR,case d17_0.STOP_PURCH when ''Y'' then ''是'' when ''N'' then ''否'' else '''' end as STOP_PURCH,data0140.part_name,d05_3.EMPLOYEE_NAME,data0140.auth3_date,D05_1.EMPLOYEE_NAME as EMPLOYEE_NAME_1 ,data0140.part_ptr,null as PRODUCT_GROUP_NAME, '+
                                      ' data0140.auth_date,case data0140.status when 0 then ''待审'' when 1 then ''已审'' when 2 then ''作废''  end status_c,data0148.INVENT_PTR  FROM    dbo.DATA0148 inner join '+
                                      ' dbo.DATA0140 ON dbo.DATA0148.PART_PTR = dbo.DATA0140.rkey INNER JOIN dbo.Data0008 ON dbo.DATA0140.part_ptr = dbo.Data0008.RKEY left JOIN dbo.Data0005 AS D05_1 ON dbo.DATA0140.user_ptr = D05_1.RKEY left JOIN '+
                                      '	dbo.Data0005 as d05_3 ON dbo.DATA0140.user3_ptr = d05_3.RKEY left join data0017 d17_0 on data0148.invent_ptr=d17_0.rkey inner join 	data0002 d02 on d17_0.STOCK_UNIT_PTR=d02.rkey '+
                                      ' where  data0148.invent_or=0  union   SELECT  data0148.seq_no,d08_1.PROD_CODE as inv_part_number,d08_1.PRODUCT_NAME as  inv_name,d08_1.PRODUCT_DESC as INV_DESCRIPTION , '+
                                      '	0.0 as  QUAN_ISSUED,data0148.QUAN_BOM,d08_1.qty_onhand as QUAN_ON_HAND,case data0148.invent_or when 0 then ''材料'' else ''半成品'' end invent_tp,data0148.production_teamname,d02.unit_name,'+
                                      '	d08_1.total_cost as STD_COST,data0148.QUAN_BOM*d08_1.total_cost as TotalCost,data0148.VENDOR,null as STOP_PURCH,data0140.part_name,d05_3.EMPLOYEE_NAME,	data0140.auth3_date,D05_1.EMPLOYEE_NAME,data0140.part_ptr,d07.PRODUCT_GROUP_NAME, '+
                                      ' data0140.auth_date,case data0140.status when 0 then ''待审'' when 1 then ''已审'' when 2 then ''作废''  end status_c,data0148.INVENT_PTR FROM   dbo.DATA0148  inner join  '+
                                      ' dbo.DATA0140 ON dbo.DATA0148.PART_PTR = dbo.DATA0140.rkey INNER JOIN 	dbo.Data0008 ON dbo.DATA0140.part_ptr = dbo.Data0008.RKEY left JOIN 	dbo.Data0005 AS D05_1 ON dbo.DATA0140.user_ptr = D05_1.RKEY left JOIN '+
                                      '	dbo.Data0005 as d05_3 ON dbo.DATA0140.user3_ptr = d05_3.RKEY left join data0008 as d08_1 on data0148.INVENT_PTR = d08_1.rkey inner join data0002 d02 on d08_1.unit_ptr=d02.rkey    '+
                                      ' inner join data0007 d07 on d08_1.PR_GRP_POINTER = d07.rkey  where  data0148.invent_or=1 '+
                                      ' ) as Quert_data where Quert_data.part_ptr= '+ QuotedStr(INVENT_id)+' ';
         //ShowMessage(DM.ADO148_detail.SQL.Text);
         DM.ADO148_detail.Open;
         DM.ADO148_detail.First;
       end;
       field_name := DBGridEh1.Columns[0].FieldName;
       PreColumn := DBGridEh1.Columns[0];
       DM.ADO148_detail.Sort := PreColumn.FieldName;
       Label1.Caption := DBGridEh1.Columns[0].Title.Caption;
       DM.ADO148_detail.First;
     if DM.ADOCon.Connected then
      begin
       DBGridEh1TitleClick(PreColumn);
        for i:=1 to DBGridEh1.Columns.Count do
        begin
          item := TmenuItem.Create(self) ;
          item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

          if DBGridEh1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              popupmenu1.Items.Add(item) ;
         end;
     end;


end;


procedure TForm_SEE.Edit1Change(Sender: TObject);
var
  i: Integer;
begin
     DBGridEh1.DataSource.DataSet.Filtered := True;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then Exit;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger] then
     begin
        if trim(Edit1.text) <> '' then
          begin
            if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
              begin
                DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(Edit1.text) + '%'')' ;
              end;
          end
        else
          DBGridEh1.DataSource.DataSet.Filter := '';
     end;
     DM.ADO148_detail.DisableControls ;
     DM.ADO148_detail.First;
     for i:=0 to DM.ADO148_detail.RecordCount -1 do
       begin
         DM.ADO148_detail.Next;
       end;
     DM.ADO148_detail.EnableControls;
end;

procedure TForm_SEE.BitBtn3Click(Sender: TObject);
begin
    common.Export_dbGridEH_to_Excel(DBGridEh1,'BOM明细查询');
end;

procedure TForm_SEE.btnUpdateClick(Sender: TObject);
begin
    DM.ADO148_detail.Close;
    DM.ADO148_detail.Prepared;
    DM.ADO148_detail.Open;
    DM.ADO148_detail.Sort := PreColumn.FieldName;
end;

procedure TForm_SEE.DBGridEh1TitleClick(Column: TColumnEh);
begin
      {  if (column.Title.SortMarker =smDownEh) then
          begin
            column.Title.SortMarker:=smUpEh;
            DM.ADO148_detail.Sort:=Column.FieldName;
          end
          else
          begin
            column.Title.SortMarker:=smDownEh;
            DM.ADO148_detail.Sort:=Column.FieldName+' DESC';
          end;

        if (field_name <> column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
        begin
          label1.Caption := column.Title.Caption ;
          label1.Left := Edit1.Left - label1.Width - 10;
          field_name := column.FieldName ;
          Edit1.SetFocus;
          PreColumn.Title.Color := clBtnFace ;
          Column.Title.Color := clred ;
          PreColumn := column ;
        end
        else
          Edit1.SetFocus;  }
          if (Column.Title.SortMarker = smDownEh) then
            begin
              Column.Title.SortMarker := smUpEh;
              DM.ADO148_detail.Sort := Column.FieldName;
            end
          else
            begin
              Column.Title.SortMarker := smDownEh;
              DM.ADO148_detail.Sort := Column.FieldName + ' DESC ';
            end;
          if (field_name <> Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString] ) then
            begin
              {}
            end;




end;

end.
