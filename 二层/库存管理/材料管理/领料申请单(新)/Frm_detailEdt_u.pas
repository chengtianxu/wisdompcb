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
    Label8: TLabel;
    CBFac: TComboBox;
    qry_temp: TADOQuery;
    qry_temp2: TADOQuery;
    chk1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBFacChange(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chk1Click(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Fdept:integer;
    s:string;
    Ffac:array[0..10] of integer;
    Fstr,Fstr2:string;//17过滤
    Fsql1,Fsql2:string;
    function CheckKZXM: Boolean;//检查控制项目
    procedure  GetQty;
  public
    class function InitEdt(iDept:integer;Grd:TStringGrid;whouse_ptr:integer):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u, Frm_detail_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iDept:integer;Grd:TStringGrid;whouse_ptr:integer): boolean;
var i:integer;
begin
  with TFrm_detailEdt.Create(nil) do
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,abbr_name from data0015 where active_flag = ' + QuotedStr('Y');
    DM.tmp.Open;
    i:=0;
    while not DM.tmp.Eof do
    begin
      Ffac[i]:=DM.tmp.Fields[0].AsInteger;
      CBFac.Items.Append(DM.tmp.Fields[1].asstring);
      DM.tmp.Next;
      inc(i);
    end;
    CBFac.ItemIndex :=  whouse_ptr;
    s:='';
    for i:=1 to Grd.RowCount-2 do
      s:=s+Grd.Cells[5,i]+',';   //rkey17 唯一
    s:=s+'0';
    DM.ADO17.Filter:='';
    DM.ADO17.Close;
    DM.ADO17.SQL.Clear;
     Fsql1:=' ( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,  '+ #13+#10+
                       '   SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,  '+ #13+#10+  //Data0023.rkey as rkey23,
                       ' d23_2.ABBR_NAME as 品牌供应商,(case when d23_2.rkey is not null then  d23_2.rkey else Data0023.rkey end ) as rkey23,'+ #13+#10+
                       '  dbo.data0016.LOCATION ,'''+'普通库存'+''' AS XY,d15.abbr_name as 工厂 '+ #13+#10+
                         ' , (case when (d391.status=2) or (d391.status is null )  then ''是''  else ''否''  end )  as  ''是否可发料'' '+ #13+#10+
                       '  FROM  dbo.Data0017 INNER JOIN  '+ #13+#10+
                       ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN  '+ #13+#10+
                       '  dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN '+#13+#10+    
                       '  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+ #13+#10+
                       '   dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+ #13+#10+
                       '  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+#13+#10+
                      ' left join data0023 as d23_2 on Data0022.ORIG_ABBRNAME=d23_2.ABBR_NAME  '+#13+#10+
                       ' inner join data0015 d15 on dbo.Data0456.warehouse_ptr=d15.rkey  '+  #13+#10+
                       ' left join data0391 d391 on data0022.rkey391=d391.rkey '+#13+#10+
                       '  WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND > 0)  '+ #13+#10+            
                       '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, '+ #13+#10+
                       '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,d23_2.ABBR_NAME,d23_2.rkey,  '+ #13+#10+
                       '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d391.status )  '+#13+#10+
       //VMI库存---------------------------------
                       '  union all  '+  #13+#10+
                       '  (    '+   #13+#10+
                       '  SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, '+#13+#10+
                       '  SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME, '+ #13+#10+
                        ' d23_2.ABBR_NAME as 品牌供应商,(case when d23_2.rkey is not null then  d23_2.rkey else Data0023.rkey end ) as rkey23,'+ #13+#10+
                       '  dbo.Data0016.LOCATION , '''+'VMI库存'+''' AS XY_1,d15.abbr_name   '+ #13+#10+
                       ' , (case when (d391.status=2) or (d391.status is null )  then ''是''  else ''否''  end )  as  ''是否可发料'' '+#13+#10+
                       '  FROM   dbo.DATA0134 INNER JOIN '+ #13+#10+
                       '  dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '+  #13+#10+
                       '  dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+#13+#10+
                       '   dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN '+ #13+#10+
                       '  dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+ #13+#10+
                       '   dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY   '+ #13+#10+
                       ' left join data0023 as d23_2 on Data0134.ORIG_ABBRNAME=d23_2.ABBR_NAME  '+#13+#10+
                       '  INNER JOIN  dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY  '+#13+#10+
                        ' inner join data0015 d15 on dbo.Data0133.warehouse_ptr=d15.rkey  '+ #13+#10+
                         ' left join data0391 d391 on DATA0134.rkey391=d391.rkey '+ #13+#10+
                       '  WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0134.QUAN_ON_HAND > 0) '+ #13+#10+       // AND (dbo.Data0134.QUAN_ON_HAND > 0)
                     //  '   AND dbo.Data0133.warehouse_ptr  =  '+inttostr(FFac[CBFac.ItemIndex])+' '+#13+#10+
                       '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,    '+ #13+#10+
                       '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,d23_2.ABBR_NAME,d23_2.rkey,   '+#13+#10+
                       '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d391.status  )    '+#13+#10+
                       '  ORDER BY    data0017.INV_PART_NUMBER  ';

    //数量=0
     Fsql2:=' ( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,  '+ #13+#10+
                       '   SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,   '+ #13+#10+
                       ' d23_2.ABBR_NAME as 品牌供应商,(case when d23_2.rkey is not null then  d23_2.rkey else Data0023.rkey end ) as rkey23,'+ #13+#10+
                       '  dbo.data0016.LOCATION ,'''+'普通库存'+''' AS XY,d15.abbr_name as 工厂 '+ #13+#10+
                         ' , (case when (d391.status=2) or (d391.status is null )  then ''是''  else ''否''  end )  as  ''是否可发料'' '+ #13+#10+
                       '  FROM  dbo.Data0017 INNER JOIN  '+ #13+#10+
                       ' dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN  '+ #13+#10+
                       '  dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN '+#13+#10+   //STOCK_UNIT_PTR
                       '  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+ #13+#10+
                       '   dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+ #13+#10+
                       '  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+#13+#10+
                      ' left join data0023 as d23_2 on Data0022.ORIG_ABBRNAME=d23_2.ABBR_NAME  '+#13+#10+
                       ' inner join data0015 d15 on dbo.Data0456.warehouse_ptr=d15.rkey  '+  #13+#10+
                       ' left join data0391 d391 on data0022.rkey391=d391.rkey '+#13+#10+
                       '  WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND= 0)  '+ #13+#10+
                      // '  AND  dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+ #13+#10+
                       '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, '+ #13+#10+
                       '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,d23_2.ABBR_NAME,d23_2.rkey, '+ #13+#10+
                       '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d391.status )  '+#13+#10+
       //VMI库存---------------------------------
                       '  union all  '+  #13+#10+
                       '  (    '+   #13+#10+
                       '  SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, '+#13+#10+
                       '  SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME,  '+ #13+#10+
                       ' d23_2.ABBR_NAME as 品牌供应商,(case when d23_2.rkey is not null then  d23_2.rkey else Data0023.rkey end ) as rkey23,'+ #13+#10+
                       '  dbo.Data0016.LOCATION , '''+'VMI库存'+''' AS XY_1,d15.abbr_name   '+ #13+#10+
                       ' , (case when (d391.status=2) or (d391.status is null )  then ''是''  else ''否''  end )  as  ''是否可发料'' '+#13+#10+
                       '  FROM   dbo.DATA0134 INNER JOIN '+ #13+#10+
                       '  dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '+  #13+#10+
                       '  dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+#13+#10+
                       '   dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN '+ #13+#10+
                       '  dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+ #13+#10+
                       '   dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY    '+ #13+#10+
                       ' left join data0023 as d23_2 on Data0134.ORIG_ABBRNAME=d23_2.ABBR_NAME   '+ #13+#10+
                       ' inner join dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY  '+#13+#10+
                        ' inner join data0015 d15 on dbo.Data0133.warehouse_ptr=d15.rkey  '+ #13+#10+
                         ' left join data0391 d391 on DATA0134.rkey391=d391.rkey '+ #13+#10+
                       '  WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0134.QUAN_ON_HAND = 0) '+ #13+#10+
                     //  '   AND dbo.Data0133.warehouse_ptr  =  '+inttostr(FFac[CBFac.ItemIndex])+' '+#13+#10+
                       '  GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,    '+ #13+#10+
                       '  dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,d23_2.ABBR_NAME,d23_2.rkey,   '+#13+#10+
                       '  dbo.data0016.LOCATION,Data0023.rkey,d15.abbr_name,d391.status  )    '+#13+#10+
                       '  ORDER BY    data0017.INV_PART_NUMBER  ';

    DM.ADO17.SQL.Text:=Fsql1;
    // ShowMessage(Fsql2);
    DM.ADO17.Open;



      Fdept:=iDept;
      field_name:='location_code';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
//     dm.ADO17.Filtered:=false;
//     dm.ADO17.Filter:=' Qty>0';
//     dm.ADO17.Filtered:=true;
      showmodal;

      free;
      DM.ADO17.Close;

  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i,CType:integer;
ssql,ssql2,sp_str,messages,s: string;
Xflag,m,n: integer;
begin
  if not CheckKZXM then Exit;
  with TFrm_out.Create(nil) do
  try
    if not DM.ADO17.IsEmpty then
    begin
      if DM.ADO17.FieldByName('是否可发料').AsString='否' then
      begin
       ShowMessage('该批料未检验或检验不合格不能发料!');
      exit;
      end;

    Edit1.Text:=DM.ADO17.Fieldbyname('INV_PART_NUMBER').AsString;
    Edit1.tag:=DM.ADO17.Fieldbyname('rkey').Asinteger;

    Edit2.Text:=DM.ADO17.Fieldbyname('INV_part_description').AsString;
    Edit3.Text:=DM.ADO17.Fieldbyname('unit_name').AsString;
    Edit4.Text:=DM.ADO17.Fieldbyname('Qty').AsString;
    if  DM.ADO17.Fieldbyname('品牌供应商').AsString<>'' then
    ComboBox1.Items.add(DM.ADO17.Fieldbyname('品牌供应商').AsString)
    else
    ComboBox1.Items.add(DM.ADO17.Fieldbyname('ABBR_NAME').AsString);

    ComboBox1.ItemIndex:=0;
    ComboBox1.tag:=DM.ADO17.Fieldbyname('rkey23').Asinteger;


       //取出物料对应的领料控制标准  lisa：
    ssql:='  select top 1  c.rkey,c.control_name, case when isfreq=1  then 1 else 0 end as ''1'', '+
    ' case when isMCount=1  then 2 else 0 end as ''2'',   '+
    ' case when IsSTime=1  then 3 else 0 end as ''3'',  '+
    ' case when IsFactor=1  then 4 else 0 end as ''4'',  '+
    ' case when IsFormula=1  then 5 else 0 end as ''5''  '+
    ' from  data0017 a                             '+
    ' left join data0155 b  on a.rkey=invt_ptr     '+
    ' left join data0136 c on b.control_ptr =c.rkey    '+
    ' where a.rkey= '+inttostr(DM.ADO17.Fieldbyname('rkey').asinteger)+' and c.DeptID_P= '+inttostr(Frm_detail.EdtDept.tag)+' '+
    '  and c.warehouse_ptr='+inttostr(Frm_detail.CBFac.tag)+'  ';
    // showmessage(ssql);
    dm.openqry(qry_temp,ssql);

     ssql2:='select * from data0589 where fac_ptr='+inttostr(Frm_detail.CBFac.tag)+'  and cost_ptr='+inttostr(Frm_detail.EdtDept.tag )+'';
      dm.openqry(qry_temp2,ssql2);

        cbb_bz.items.clear;
        cbb_bz.itemindex:=-1;
        cbb_bz.hint:='';
        cbb_bz.tag:=0;

//     if   not qry_temp2.isempty then
//     begin


         if (not qry_temp.isempty)  then        //有标准
          begin

           cbb_bz.Tag := qry_temp.FieldByName('rkey').AsInteger;

          if qry_temp.FieldByName('1').AsInteger =1 then
          begin
          cbb_bz.items.AddObject('1.按保养频率;',TObject(1));

          end;
           if qry_temp.FieldByName('2').AsInteger =2 then
           begin
           cbb_bz.items.AddObject('2.按员工人数;',TObject(2));

           end;
           if qry_temp.FieldByName('3').AsInteger =3 then
           begin
           cbb_bz.items.AddObject('3.按固定时间;',TObject(3));

           end;
           if qry_temp.FieldByName('4').AsInteger =4 then
           begin
           cbb_bz.items.AddObject('4.按生产因素;',TObject(4));

           end;
            if qry_temp.FieldByName('5').AsInteger =5 then
           begin
           cbb_bz.items.AddObject('5.按公式;',TObject(5));

           end;

          if cbb_bz.items.Count=1 then
            begin
             cbb_bz.itemindex:=0;

            with dm.sp1 do
            begin
            dm.sp1.close;
            dm.sp1.Parameters.ParamByName('@CType').Value:=IntToStr(Integer(cbb_BZ.Items.Objects[cbb_BZ.itemindex]));
            dm.sp1.Parameters.ParamByName('@warehouse_ptr').Value:=Frm_detail.CBFac.tag  ;
            dm.sp1.Parameters.ParamByName('@control_ptr').Value:=cbb_BZ.Tag;
            dm.sp1.Parameters.ParamByName('@cost_ptr').Value:=Frm_detail.EdtDept.tag  ;
          // dm.sp1.Parameters.ParamByName('@invt_ptr').Value:=Edit1.tag  ;
            dm.sp1.Parameters.ParamByName('@ReqDate').Value:=strtodate(formatdatetime('yyyy-MM-dd',Frm_detail.DateTimePicker1.date))  ;
            dm.sp1.Parameters.ParamByName('@nowqty').Value:=0;
            dm.sp1.Parameters.ParamByName('@AllQty').Value:=0;
            dm.sp1.Parameters.ParamByName('@GetQty').Value:=0;
             dm.sp1.Parameters.ParamByName('@QCQty').Value:=0;
            dm.sp1.Parameters.ParamByName('@smessage').Value:='';
            ExecProc;
           // showmessage((FormatDateTime('yyyy-MM-dd',Frm_detail.DateTimePicker1.date)));
            edt1.text:=floatToStr(dm.sp1.Parameters.ParamByName('@AllQty').Value);
            edt2.text:=floatToStr(dm.sp1.Parameters.ParamByName('@GetQty').Value);
            edt_remark.text :=dm.sp1.Parameters.ParamByName('@QCQty').Value;
            
             if dm.sp1.Parameters.ParamByName('@AllQty').Value-dm.sp1.Parameters.ParamByName('@GetQty').Value-dm.sp1.Parameters.ParamByName('@QCQty').Value<0  then
             edt3.text:='0'
             else
             edt3.text:=floatToStr(dm.sp1.Parameters.ParamByName('@AllQty').Value-dm.sp1.Parameters.ParamByName('@GetQty').Value-dm.sp1.Parameters.ParamByName('@QCQty').Value);
              //mmo1.text:=dm.sp1.Parameters.ParamByName('@smessage').Value;
            end


             end
          else
            cbb_bz.ItemIndex:=-1;
         end
         else
         begin
          cbb_bz.items.AddObject('V无领料标准;',TObject(0));
          cbb_bz.itemindex:=0;
         // edt_remark.text:='V无领料标准;';
//          edt1.text:='0';
//          edt2.text:='0';
//          edt3.text:='0';
         end;


//         else                                             //按标准领料的物料没制定标准不允许领料
//         begin
//          cbb_bz.items.AddObject('X无领料标准禁止领料;',TObject(0));
//          cbb_bz.itemindex:=0;
//          cbb_bz.hint:='0';
//         edt_remark.text:='X无领料标准禁止领料';
//         edt1.text:='0';
//         edt2.text:='0';
//         edt3.text:='0';
//         end;


//     end
//    else  //无标准和公式正常领料
//    begin
//          cbb_bz.items.clear;
//          cbb_bz.items.AddObject('V无领料标准正常领料;',TObject(6));
//          cbb_bz.itemindex:=0;
//          edt_remark.text:='V无领料标准正常领料';
//         cbb_bz.hint:='6';
//         edt1.text:='0';
//         edt2.text:='0';
//         edt3.text:='0';
//    end;

     ////////////////
//    DM.tmp.Close;
////    DM.tmp.SQL.Text:='SELECT dbo.Data0023.abbr_NAME '+
////                     'FROM dbo.Data0023 INNER JOIN '+
////                     'dbo.Data0028 ON dbo.Data0023.RKEY = dbo.Data0028.SUPPLIER_PTR '+
////                     'where data0028.INVENTORY_PTR='+DM.ADO17.Fieldbyname('rkey').AsString;
//
//  DM.tmp.SQL.Text:= 'SELECT dbo.data0023.abbr_NAME '+
//                     'FROM dbo.Data0023 '+
//                     'where data0023.rkey='+DM.ADO17.Fieldbyname('rkey23').AsString;
//    DM.tmp.Open;
//    while not DM.tmp.Eof do
//    begin
//      ComboBox1.Items.Append(DM.tmp.Fields[0].asstring);
//      DM.tmp.Next;
//    end;
//    DM.tmp.Close;


      i:=FGrd.RowCount-2;
          
        if showmodal=mrok then
        begin
            if FGrd.rowcount<=2 then
            begin
             i:=1;
            FGrd.Cells[0,i]:=Edit1.Text;
            FGrd.Cells[1,i]:=Edit2.Text;
            FGrd.Cells[2,i]:=Edit5.Text;
            FGrd.Cells[3,i]:=ComboBox1.Text;    //备注
            FGrd.Cells[4,i]:=DM.ADO17.Fieldbyname('unit_name').AsString;
            FGrd.Cells[5,i]:=DM.ADO17.Fieldbyname('rkey').AsString;
            FGrd.Cells[6,i]:=DM.ADO17.Fieldbyname('XY').AsString;
            if not qry_temp.IsEmpty  then
            FGrd.Cells[7,i]:=qry_temp.Fieldbyname('control_name').AsString;
            FGrd.Cells[8,i]:=cbb_BZ.text ;
            FGrd.Cells[10,i]:=Trim(mmo1.Text);
            FGrd.Cells[11,i]:=IntToStr(ComboBox1.tag) ;
            s:=s+' , '+DM.ADO17.Fieldbyname('rkey').AsString;
            FGrd.RowCount:=FGrd.RowCount+1;
           end
           else
           begin
            for n:=1  to i do
            if (FGrd.Cells[5,n]=DM.ADO17.Fieldbyname('rkey').asstring) and (FGrd.Cells[11,n]=DM.ADO17.Fieldbyname('rkey23').asstring) then
            begin
             FGrd.Cells[2,n]:= floattostr(strtofloat(FGrd.Cells[2,n])+strtofloat(trim(Edit5.Text)));
             m:=1;
            end;

           if m<>1 then 
            begin
            FGrd.Cells[0,FGrd.RowCount-1]:=Edit1.Text;
            FGrd.Cells[1,FGrd.RowCount-1]:=Edit2.Text;
            FGrd.Cells[2,FGrd.RowCount-1]:=Edit5.Text;
            FGrd.Cells[3,FGrd.RowCount-1]:=ComboBox1.Text;    //备注
            FGrd.Cells[4,FGrd.RowCount-1]:=DM.ADO17.Fieldbyname('unit_name').AsString;
            FGrd.Cells[5,FGrd.RowCount-1]:=DM.ADO17.Fieldbyname('rkey').AsString;
            FGrd.Cells[6,FGrd.RowCount-1]:=DM.ADO17.Fieldbyname('XY').AsString;
            if not qry_temp.IsEmpty  then
            FGrd.Cells[7,FGrd.RowCount-1]:=qry_temp.Fieldbyname('control_name').AsString;
            FGrd.Cells[8,FGrd.RowCount-1]:=cbb_BZ.text ;
            FGrd.Cells[10,FGrd.RowCount-1]:=Trim(mmo1.Text);
            FGrd.Cells[11,FGrd.RowCount-1]:=IntToStr(ComboBox1.tag) ;
            s:=s+' , '+DM.ADO17.Fieldbyname('rkey').AsString;
            FGrd.RowCount:=FGrd.RowCount+1;
            
           end;
          end;
          
            if DM.ADO468_1.Locate('INVENT_PTR;supplier_ptr',VarArrayOf([DM.ADO17.Fieldbyname('rkey').asinteger,DM.ADO17.Fieldbyname('rkey23').asinteger]), []) then
            begin
            DM.ADO468_1.edit;
            DM.ADO468_1.FieldByName('quan_bom').AsFloat:=DM.ADO468_1.FieldByName('quan_bom').AsFloat+strtofloat(trim(Edit5.Text));
            DM.ADO468_1.Post;
            end
            else
            begin
            DM.ADO468_1.Append;
            DM.ADO468_1.FieldByName('INVENT_PTR').AsInteger :=DM.ADO17.Fieldbyname('rkey').AsInteger;
            DM.ADO468_1.FieldByName('control_ptr').AsInteger:=cbb_BZ.tag;//lisa
            DM.ADO468_1.FieldByName('remark').AsString:=TrimLeft(edt_remark.text);//lisa
            DM.ADO468_1.FieldByName('quan_bom').AsString:=Edit5.Text;
            DM.ADO468_1.FieldByName('VENDOR').AsString:=ComboBox1.Text;
            DM.ADO468_1.FieldByName('supplier_ptr').AsInteger:= ComboBox1.tag ;
            DM.ADO468_1.FieldByName('step').AsInteger:=0;
            DM.ADO468_1.FieldByName('dept_ptr').AsInteger:=Fdept;
            DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;
            DM.ADO468_1.Post;
            end;

//            FGrd.Cells[0,i]:=Edit1.Text;
//            FGrd.Cells[1,i]:=Edit2.Text;
//            FGrd.Cells[2,i]:=Edit5.Text;
//            FGrd.Cells[3,i]:=ComboBox1.Text;    //备注
//            FGrd.Cells[4,i]:=DM.ADO17.Fieldbyname('unit_name').AsString;
//            FGrd.Cells[5,i]:=DM.ADO17.Fieldbyname('rkey').AsString;
//            FGrd.Cells[6,i]:=DM.ADO17.Fieldbyname('XY').AsString;
//            if not qry_temp.IsEmpty  then
//            FGrd.Cells[7,i]:=qry_temp.Fieldbyname('control_name').AsString;
//            FGrd.Cells[8,i]:=cbb_BZ.text ;
//            FGrd.Cells[10,i]:=Trim(mmo1.Text);
//            FGrd.Cells[11,i]:= IntToStr(ComboBox1.tag) ;
//            s:=s+' , '+DM.ADO17.Fieldbyname('rkey').AsString;
//            FGrd.RowCount:=FGrd.RowCount+1;
//
//            DM.ADO468_1.Append;
//            DM.ADO468_1.FieldByName('INVENT_PTR').AsString:=FGrd.Cells[5,i];
//            DM.ADO468_1.FieldByName('control_ptr').AsInteger:=cbb_BZ.tag;//lisa
//            DM.ADO468_1.FieldByName('remark').AsString:=TrimLeft(edt_remark.text);//lisa
//            DM.ADO468_1.FieldByName('quan_bom').AsString:=Edit5.Text;
//            DM.ADO468_1.FieldByName('VENDOR').AsString:=ComboBox1.Text;
//            DM.ADO468_1.FieldByName('supplier_ptr').AsInteger:= ComboBox1.tag ;
//            DM.ADO468_1.FieldByName('step').AsInteger:=0;
//            DM.ADO468_1.FieldByName('dept_ptr').AsInteger:=Fdept;
//            DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;
//            DM.ADO468_1.Post;


          DM.ADO17.Delete;
         end;
    end;
  finally
    free;
    if DM.ADO17.IsEmpty then self.close;
  end;

end;

procedure  TFrm_detailEdt.GetQty;
begin
 //取得数量：
//    with TFrm_out.Create(nil) do
//     try
//      with sp1 do
//      begin
//      sp1.close;
//      sp1.Parameters.ParamByName('@CType').Value:=IntToStr(Integer(cbb_BZ.Items.Objects[cbb_BZ.itemindex]));
//      sp1.Parameters.ParamByName('@warehouse_ptr').Value:=Frm_detail.CBFac.tag  ;
//      sp1.Parameters.ParamByName('@control_ptr').Value:=cbb_bz.Tag;
//      sp1.Parameters.ParamByName('@cost_ptr').Value:=Frm_detail.EdtDept.tag  ;
//      sp1.Parameters.ParamByName('@invt_ptr').Value:=Edit1.tag  ;
//      sp1.Parameters.ParamByName('@ReqDate').Value:=Frm_detail.DateTimePicker1.date  ;
//      sp1.Parameters.ParamByName('@AllQty').Value:=0;
//      sp1.Parameters.ParamByName('@GetQty').Value:=0;
//      sp1.Parameters.ParamByName('@smessage').Value:='';
//      ExecProc;
//      edt1.text:=floatToStr(sp1.Parameters.ParamByName('@AllQty').Value);
//      edt2.text:=floatToStr(sp1.Parameters.ParamByName('@GetQty').Value);
//      if sp1.Parameters.ParamByName('@AllQty').Value-sp1.Parameters.ParamByName('@GetQty').Value<0  then
//        edt3.text:='0'
//      else
//      edt3.text:=floatToStr(sp1.Parameters.ParamByName('@AllQty').Value-sp1.Parameters.ParamByName('@GetQty').Value);
//
//      edt_remark.text:=TrimLeft(sp1.Parameters.ParamByName('@smessage').Value+' '+cbb_BZ.Text+' :可领数量:'+edt1.Text+';已领数量:'+edt2.Text+ ';还剩可领数:' +edt3.Text);
//      end
//
//     finally
//    free;
//    if DM.ADO17.IsEmpty then self.close;
//  end;
end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO17.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO17.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
      label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_detailEdt.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin

    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      begin
        Fstr2:= ' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')';
        Grd1.DataSource.DataSet.Filter:= fstr2;
      end
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      begin
        Fstr2:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
        Grd1.DataSource.DataSet.Filter:= fstr2;
      end;
    end else
    begin
      Fstr2:='';
      Grd1.DataSource.DataSet.Filter:='';
    end;  
  end;
end;

procedure TFrm_detailEdt.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
     //dm.ADO17.Filtered:=false;
     Fstr:=  ' Qty>0';
     dm.ADO17.Filter:=Fstr;
     //dm.ADO17.Filtered:=true;
end;

procedure TFrm_detailEdt.CBFacChange(Sender: TObject);
begin
//    DM.ADO17.Filter:='';
//    DM.ADO17.Close;
//    DM.ADO17.SQL.Text:=' ( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION,  '+
//                       '         SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,Data0023.rkey as rkey23,   '+
//                       '         dbo.data0016.LOCATION ,'''+'普通库存'+''' AS XY '+
//                       '         FROM         dbo.Data0017 INNER JOIN  '+
//                       '                                dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN  '+
//                       '                                dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
//                       '                                dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN '+
//                       '                                dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0016.RKEY INNER JOIN '+
//                       '                                dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY '+
//                       '         WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0022.QUAN_ON_HAND > 0) AND '+
//                       '         dbo.Data0456.warehouse_ptr =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
//                       '         GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,Data0023.rkey, '+
//                       '         dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION '+
//                       '         )  '+
//                       '         union all  '+
//                       '         (    '+
//                       '         SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, '+
//                       '         SUM(dbo.Data0134.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME,Data0023.rkey as rkey23,  '+
//                       '         dbo.Data0016.LOCATION , '''+'VMI库存'+''' AS XY_1 '+
//                       '         FROM         dbo.DATA0134 INNER JOIN '+
//                       '         dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN '+
//                       '         dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN  '+
//                       '         dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN '+
//                       '         dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
//                       '         dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN  '+
//                       '         dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0001.RKEY  '+
//                       '         WHERE   dbo.Data0017.RKEY not in ('+s+') AND (dbo.Data0134.QUAN_ON_HAND > 0) AND dbo.Data0133.warehouse_ptr  '+
//                       '         =  '+inttostr(FFac[CBFac.ItemIndex])+' '+
//                       '         GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,Data0023.rkey,    '+
//                       '         dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME,dbo.data0016.LOCATION  '+
//                       '         )   '+
//                       '         ORDER BY  dbo.Data0017.INV_PART_NUMBER  '+#13;
//
//      DM.ADO17.Open;
end;

procedure TFrm_detailEdt.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (ssAlt in Shift)  and  (Key=86) then
        showmessage(DM.ADO17.SQL.Text);
end;

function TFrm_detailEdt.CheckKZXM: Boolean;
var
  LS: TStringList;
  I: Integer;
  tmpIndex: Integer;
  bHasExist: Boolean;
begin
  Result := True;
  DM.adsKZXM.Close;
  DM.adsKZXM.Parameters.ParamByName('PRKey17').Value := DM.ADO17.fieldbyname('RKey').AsInteger;
  DM.adsKZXM.Parameters.ParamByName('PRKey15').Value := Ffac[Frm_detail.CBFac.ItemIndex];
  DM.adsKZXM.Parameters.ParamByName('PRKey34').Value := Frm_detail.EdtDept.Tag;
  DM.adsKZXM.Open;

  if DM.adsKZXM.IsEmpty then Exit;
  if Frm_detail.cbbKZXM.Items.Count = 0 then
  begin
    while not DM.adsKZXM.Eof do
    begin
      Frm_detail.cbbKZXM.AddItem(DM.adsKZXM.fieldbyname('control_name').AsString,Pointer(DM.adsKZXM.fieldbyname('RKey').asInteger));
      DM.adsKZXM.Next;
    end;
    Frm_detail.cbbKZXM.ItemIndex := 0;
  end
  else
  begin
    DM.adsKZXM.First;
    while not DM.adsKZXM.Eof do
    begin
      bHasExist := False;
      for I := 0 to Frm_detail.cbbKZXM.Items.Count - 1 do
      begin
        if Integer(Frm_detail.cbbKZXM.Items.Objects[I]) = DM.adsKZXM.fieldbyname('RKey').asInteger then
        begin
          bHasExist := True;
          Break;
        end;
      end;
      if not bHasExist then
      begin
        Frm_detail.cbbKZXM.AddItem(DM.adsKZXM.fieldbyname('control_name').AsString,Pointer(DM.adsKZXM.fieldbyname('RKey').asInteger));
      end;
      DM.adsKZXM.Next;
    end;

//
//    LS := TStringList.Create;
//    try
//    while not DM.adsKZXM.Eof do
//    begin
//      for I := 0 to Frm_detail.cbbKZXM.Items.Count - 1 do
//      begin
//        if Integer(Frm_detail.cbbKZXM.Items.Objects[I]) = DM.adsKZXM.fieldbyname('RKey').asInteger then
//        begin
//          LS.AddObject(Frm_detail.cbbKZXM.Items[I],Frm_detail.cbbKZXM.Items.Objects[I]);
//        end;
//      end;
//      DM.adsKZXM.Next;
//    end;
//    if LS.Count = 0 then
//    begin
//      ShowMessage('一张配料单中不能有2种不同控制项目的材料');
//      Result := False;
//    end else
//    begin
//      tmpIndex := Frm_detail.cbbKZXM.ItemIndex;
//      Frm_detail.cbbKZXM.Items.Clear;
//      Frm_detail.cbbKZXM.Items.Assign(LS);
//      if Frm_detail.cbbKZXM.Items.Count -1 >= tmpIndex then
//      begin
//        Frm_detail.cbbKZXM.ItemIndex := tmpIndex;
//      end else
//        Frm_detail.cbbKZXM.ItemIndex := 0;
//    end;
//    finally
//      LS.Free;
//    end;
  end;
end;

procedure TFrm_detailEdt.chk1Click(Sender: TObject);
begin
  if chk1.Checked  then
  begin
    dm.openqry(dm.ADO17, Fsql2);
     // ShowMessage('Fsql2:  '+Fsql2);
  if fstr2<>'' then
  DM.ADO17.Filter:=fstr2
  else
  DM.ADO17.Filter:='';
  end
  else
  begin
  dm.openqry(dm.ADO17, Fsql1);
  //ShowMessage('Fsql1:  '+Fsql1);
  if fstr2<>'' then
  DM.ADO17.Filter:=fstr2
  else
  DM.ADO17.Filter:='' ;
  end
end;

end.
