unit Frm_detailEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TFrm_detailEdt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grd1: TDBGridEh;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
  public
    iSumNumber:integer;
    class function InitEdt(iType:integer;Grd:TStringGrid):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u, Frm_ZZout_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iType:integer;Grd:TStringGrid): boolean;
var i:integer;
    s:string;
begin
  with TFrm_detailEdt.Create(nil) do
  begin
    s:='';
    for i:=1 to Grd.RowCount-2 do
    s:=s+Grd.Cells[9,i]+',';  //rkey220 唯一
    s:=s+'0';
    DM.ADO160.Close;
    DM.ADO160.SQL.Text:='select data0219.grn_number,data0219.create_date,data0160.location_code,data0160.location_name,'+
                        'data0017.INV_PART_NUMBER, data0017.INV_part_description,'+
                        '(data0220.quan_on_hand-data0220.quan_alloc) Quan_valid,data0220.oh_degree,'+
                        'data0017.RKEY rkey17, data0160.rkey rkey160,data0220.rkey rkey220,data0160.type,data0220.supplier_ptr, '+
                        'case data0160.type when 1 then ''库房'' when 2 then ''待研磨仓'' when 3 then ''机器'' '+
                        'when 4 then ''研磨商'' when 5 then ''报废仓''  end  Type_c,data0220.remark '+
                        'from data0160 inner join data0220 on data0160.rkey=data0220.location_ptr '+
                        'inner join data0017 on data0220.inventory_ptr=data0017.rkey '+
                        'inner join data0219 on data0220.grn_ptr=data0219.rkey '+
                        'where data0160.type='+inttostr(iType)+' and data0220.quan_on_hand-data0220.quan_alloc>0 '+
                        'and data0220.rkey not in ('+s+') order by dbo.data0160.oh_degree,dbo.data0219.create_date,data0220.quan_on_hand';
    DM.ADO160.Open;
    if DM.ADO160.IsEmpty then
    begin
      showmessage('当前没有可用库存...');
      result:=false;
      free;
    end else begin
      field_name:='INV_PART_NUMBER';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      
      showmodal;

      iSumNumber:=0;
      for i:=1 to FGrd.RowCount-2 do
      begin
        iSumNumber:=iSumNumber+StrToInt(FGrd.Cells[5,i]);
      end;
//      if (Grd.RowCount=2) then FGrd.RowCount:=FGrd.RowCount+1;
      FGrd.Cells[4,FGrd.RowCount-1]:='合计';
      FGrd.Cells[5,FGrd.RowCount-1]:=IntToStr(iSumNumber);

      result:=FGrd.RowCount>2;
      free;
      DM.ADO160.Filter:='';
    end;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i,j,iSum,iSumSG:integer;
begin
  with TFrm_out.Create(nil) do
  try
    Edit1.Text:=DM.ADO160.Fieldbyname('location_code').AsString;
    Label3.Caption:=DM.ADO160.Fieldbyname('location_name').AsString;
    Edit2.Text:=DM.ADO160.Fieldbyname('INV_PART_NUMBER').AsString;
    Label8.Caption:=DM.ADO160.Fieldbyname('INV_part_description').AsString;
    Edit3.text:=DM.ADO160.Fieldbyname('oh_degree').AsString;
    Edit4.Text:=DM.ADO160.Fieldbyname('Quan_valid').AsString;
    Edit5.Text:=DM.ADO160.Fieldbyname('Quan_valid').AsString;
    iSum:=0;
    for j:=1 to FGrd.RowCount-2 do
    begin
      if (FGrd.Cells[4,j]=Edit3.text) then
      begin
        iSum:=iSum+StrToInt(FGrd.Cells[5,j]);
      end;
    end;
    Edit7.Text:=IntToStr(iSum);
    Edit8.Text:=IntToStr(iSum+DM.ADO160.Fieldbyname('Quan_valid').AsInteger);
    i:=FGrd.RowCount-1;
    if showmodal=mrok then
    begin
      FGrd.Cells[0,i]:=Edit1.Text;      //位置代码
      FGrd.Cells[1,i]:=Label3.Caption; //位置名称
      FGrd.Cells[2,i]:=Edit2.Text;     //钻嘴编码
      FGrd.Cells[3,i]:=Label8.Caption; //钻嘴名称
      FGrd.Cells[4,i]:=Edit3.Text;    //研磨次数
      FGrd.Cells[5,i]:=Edit5.text;    //发放数量
      FGrd.Cells[6,i]:=Edit6.Text;    //备注
      FGrd.Cells[7,i]:=DM.ADO160.Fieldbyname('rkey17').AsString;
      FGrd.Cells[8,i]:=DM.ADO160.Fieldbyname('rkey160').AsString;
      FGrd.Cells[9,i]:=DM.ADO160.Fieldbyname('rkey220').AsString;
      FGrd.Cells[10,i]:=DM.ADO160.Fieldbyname('supplier_ptr').AsString;
      FGrd.RowCount:=FGrd.RowCount+1;
      DM.ADO160.Delete;

//      iSumSG:=0;
//      for i:=1 to FGrd.RowCount-2 do
//      begin
//        iSumSG:=iSumSG+StrToInt(FGrd.Cells[5,i]);
//      end;
//      FGrd.Cells[4,FGrd.RowCount]:='合计';
//      FGrd.Cells[5,FGrd.RowCount]:=IntToStr(iSumSG);
    end;
  finally
    free;
    if DM.ADO160.IsEmpty then self.close;
  end;
end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO160.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO160.Sort:=Column.FieldName+' DESC';
  end;

  if (field_name <> column.FieldName) and not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edit1.SetFocus;
end;

procedure TFrm_detailEdt.Edit1Change(Sender: TObject);
var s:string;
    i:integer;
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        s:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        s:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      s:='';
    if trim(Edit2.text) <> '' then
      if s<>'' then s:=s+' and oh_degree='+edit2.Text else s:='oh_degree='+edit2.Text;
   i:=0;
   Grd1.DataSource.DataSet.Filter:=s;
   Grd1.DataSource.DataSet.DisableControls;
   Grd1.DataSource.DataSet.First;
   while not Grd1.DataSource.DataSet.Eof do
   begin
     i:=i+Grd1.DataSource.DataSet.FieldByName('Quan_valid').AsInteger;
     Grd1.DataSource.DataSet.Next;
   end;

   Grd1.DataSource.DataSet.EnableControls;
   Grd1.Columns[2].Footer.value:=inttostr(i);
   edit3.Text:=Grd1.Columns[2].Footer.value;
  end;
end;

procedure TFrm_detailEdt.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
  iSumNumber:=0;
end;

procedure TFrm_detailEdt.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then begin key:=#0;abort;end;
end;

procedure TFrm_detailEdt.Button1Click(Sender: TObject);
var i,iQty,iCurQty:integer;

begin
  if (Trim(Edit2.Text)='') then
  begin
    showmessage('请确定研磨次数 ...');
    exit;
  end;
  if strtoint('0'+edit3.Text)>strtoint(Grd1.GetFooterValue(0,Grd1.Columns[2]))  then //strtoint(Grd1.Columns[2].Footer.value)
  begin
    showmessage('发放数量超过当前有效库存...');
    exit;
  end;
  if (edit3.Text='') or (edit3.Text='0') then
  begin
    showmessage('发放数量不能为0 ...');
    exit;
  end;

    i:=FGrd.RowCount-1;
    iQty:=strtoint(edit3.Text);//发放数量
    DM.ADO160.First;
    iCurQty:=0;
    while not DM.ADO160.Eof do
    begin
      if iCurQty+DM.ADO160.Fieldbyname('Quan_valid').AsInteger<=iQty then
         FGrd.Cells[5,i]:=DM.ADO160.Fieldbyname('Quan_valid').AsString        //发放数量
      else
        FGrd.Cells[5,i]:=inttostr(iQty-iCurQty);

      iCurQty:=iCurQty+DM.ADO160.Fieldbyname('Quan_valid').AsInteger;
      FGrd.Cells[0,i]:=DM.ADO160.Fieldbyname('location_code').AsString;      //位置代码
      FGrd.Cells[1,i]:=DM.ADO160.Fieldbyname('location_name').AsString;    //位置名称
      FGrd.Cells[2,i]:=DM.ADO160.Fieldbyname('INV_PART_NUMBER').AsString;     //钻嘴编码
      FGrd.Cells[3,i]:=DM.ADO160.Fieldbyname('INV_part_description').AsString; //钻嘴名称
      FGrd.Cells[4,i]:=DM.ADO160.Fieldbyname('oh_degree').AsString;         //研磨次数

     // FGrd.Cells[6,i]:=Edit6.Text;    //备注

      FGrd.Cells[7,i]:=DM.ADO160.Fieldbyname('rkey17').AsString;
      FGrd.Cells[8,i]:=DM.ADO160.Fieldbyname('rkey160').AsString;
      FGrd.Cells[9,i]:=DM.ADO160.Fieldbyname('rkey220').AsString;
      FGrd.Cells[10,i]:=DM.ADO160.Fieldbyname('supplier_ptr').AsString;
      FGrd.RowCount:=FGrd.RowCount+1;
      inc(i);
      DM.ADO160.Delete;
      if  iCurQty>=iQty then break;
    end;
end;

end.
