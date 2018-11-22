unit Uqty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TQty_form = class(TForm)
    SGrid1: TStringGrid;
    txt2: TStaticText;
    btn3: TBitBtn;
    btn2: TBitBtn;
    btn4: TBitBtn;
    stat1: TStatusBar;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    dtpk3: TDateTimePicker;
    dtpk4: TDateTimePicker;
    rg2: TRadioGroup;
    grp1: TGroupBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    rg1: TRadioGroup;
    procedure btn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure rg1Click(Sender: TObject);
  private
    SQLINI,rkey19: string ;
    procedure update_sgrid(sgrid_row:byte);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qty_form: TQty_form;

implementation

uses Udm,common, UWZCX22,DateUtils,pick_item_single,constvar,
  Inv_Group_Select;

{$R *.dfm}

procedure TQty_form.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.con1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
 { dm.con1.Open;
  user_ptr := '3';
  vprev := '4';    }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TQty_form.FormShow(Sender: TObject);
begin
   if  dm.con1.Connected then
   begin

            with dm.qrytemp do
            begin
                close;
                sql.Text:='SELECT DATEADD(yy, DATEDIFF(yy,0,getdate()-365), 0) as sys_date';
                open;
                dtpk1.Date:=DateOf(fieldvalues['sys_date']);
                close;
                sql.Text:='SELECT dateadd(ms,-3,DATEADD(yy, DATEDIFF(yy,0,getdate()), 0)) as sys_date';
                open;
                dtpk2.Date:=DateOf(fieldvalues['sys_date']);
                close;
                sql.Text:='SELECT getdate() as sys_date';
                open;
                dtpk4.Date:=DateOf(fieldvalues['sys_date']);
                close;
                sql.Text:='SELECT getdate()-30 as sys_date';
                open;
                dtpk3.Date:=DateOf(fieldvalues['sys_date']);
                close;
            end;
   end;
            sgrid1.Cells[0,0]:='条件名';
            sgrid1.Cells[1,0]:='条件值';
            SQLINI := 'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0496.GROUP_DESC, '
              + #13#10 +
              '                      dbo.Data0019.inv_group_desc, dbo.Data0023.ABBR_NAME, ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) AS avg_price, '
              + #13#10 +
              '  SUM(dbo.Data0022.QUANTITY) AS total_qty, case when derivedtbl_1.oldavgprice=0 then ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) else derivedtbl_1.oldavgprice end as oldavgprice,'
              + #13#10 +
              '   CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE ROUND(AVG(dbo.Data0022.tax_price *  dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice end AS decimal(10, 2)) AS ud_price,  '
              + #13#10 +
              '  CAST(CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE (ROUND(AVG (dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice)  / derivedtbl_1.oldavgprice * 100 END AS decimal(10, 2)) AS VARCHAR (100)) + ''%'' AS ud_percent,  '
              + #13#10 +
              ' CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE (ROUND(AVG(dbo.Data0022.tax_price *  dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice) * SUM(dbo.Data0022.QUANTITY) end AS decimal(10,  2))  AS total_updown '
              + #13#10 + 'FROM         dbo.Data0022 INNER JOIN' +
              #13#10 +
              '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey LEFT OUTER JOIN' 
              + #13#10 +
              '                          (SELECT     Data0023.ABBR_NAME AS old_abbrname, Data0022.INVENTORY_PTR, CAST(SUBSTRING(MAX(CONVERT(varchar, Data0456.ship_DATE, 101) '
              + #13#10 +
              '                                                   + STR(Data0022.tax_price * Data0456.exch_rate, 10, 2)), 11, 10) AS decimal(10, 2)) AS oldavgprice'
              + #13#10 +
              '                            FROM          dbo.Data0022  INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0017  ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0456  ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0023  ON Data0456.SUPP_PTR = Data0023.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0496 ON Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey '
              + #13#10 +
              '                            WHERE      (1 = 1) AND (Data0456.ship_DATE >= '+ QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk1.date))+') AND (Data0456.ship_DATE <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk2.date))+')'
              + #13#10 +
              '                            GROUP BY Data0023.ABBR_NAME, Data0022.INVENTORY_PTR) AS derivedtbl_1 ON dbo.Data0022.INVENTORY_PTR = derivedtbl_1.INVENTORY_PTR '
              + #13#10 +
              '                           AND dbo.Data0023.ABBR_NAME = derivedtbl_1.old_abbrname'
              + #13#10 +
              'WHERE     (1 = 1) AND (dbo.Data0456.ship_DATE >= '+ QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk3.date))+') AND (dbo.Data0456.ship_DATE <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk4.date))+')'
              + #13#10 +
              'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, '
              + #13#10 +
              '                      dbo.Data0017.RKEY, dbo.Data0496.GROUP_DESC, dbo.Data0019.inv_group_desc, derivedtbl_1.oldavgprice';

end;

procedure TQty_form.btn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
    sgrid1.Rows[i].Clear;
    sgrid1.RowCount:=2;
end;

procedure TQty_form.N1Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TQty_form.ListBox1Click(Sender: TObject);
begin
      label2.Caption:=listbox1.Items[listbox1.itemindex];
      edit1.Text:='';
      button1.Enabled:=true;
      BitBtn4.Enabled := True;
      edit1.Visible:=true;
      case listbox1.ItemIndex of
          0,1,2,3,4 : BitBtn4.Visible := True;
//          4: BitBtn4.Visible := False;
      end;

end;

procedure TQty_form.btn3Click(Sender: TObject);
var
  i: Integer;
begin

  dm.qry1.Close;
  dm.qry1.SQL.Clear;
  dm.qry1.SQL.Text:= SQLINI;
//  ShowMessage(dm.qry1.SQL.Strings[22]);
//   ShowMessage(dm.qry1.SQL.Strings[25]);
//  dm.qry1.SQL.Insert(22,' and d456.ship_DATE >= '+quotedstr(datetostr(dtpk1.Date))+' and d456.ship_DATE <='+quotedstr(datetostr(dtpk2.Date)));
//  dm.qry1.SQL.Insert(26,' and dbo.Data0456.ship_DATE >= '+quotedstr(datetostr(dtpk3.Date))+' and dbo.Data0456.ship_DATE <='+quotedstr(datetostr(dtpk4.Date)));
  case rg2.ItemIndex of
   0: begin
            for i:=1 to sgrid1.RowCount-2 do
              begin
                 if (sgrid1.Cells[0,i] = '现供应商')and (rg1.ItemIndex=1) then
                 begin
                   dm.qry1.SQL.Insert(i+24,sgrid1.Cells[2,i]);
                 end
                 else
                 begin
                   dm.qry1.SQL.Insert(22,sgrid1.Cells[2,i]);
                   dm.qry1.SQL.Insert(i+25,sgrid1.Cells[2,i]);
                 end;

              end;
//        showmessage(dm.qry1.SQL.Text);
        if CheckBox1.Checked then
            dm.qry1.SQL.Insert(dm.qry1.SQL.Count,' HAVING  (CAST(ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice AS decimal(10, 2)) <> 0)');
            dm.qry1.Open;
            main_form:=Tmain_form.Create(application);
            main_form.ShowModal;
            main_form.free;
      end;
   1: begin
            for i:=1 to sgrid1.RowCount-2 do
              begin
                 if (sgrid1.Cells[0,i] = '现供应商')and (rg1.ItemIndex=1) then
                 begin
                   dm.qry1.SQL.Insert(i+24,sgrid1.Cells[2,i]);
                 end
                 else
                 begin
                   dm.qry1.SQL.Insert(22,sgrid1.Cells[2,i]);
                   dm.qry1.SQL.Insert(i+25,sgrid1.Cells[2,i]);
                 end;

              end;
        if CheckBox1.Checked then
            dm.qry1.SQL.Insert(dm.qry1.SQL.Count,' HAVING  (CAST(ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice AS decimal(10, 2)) < 0)')
        else
            dm.qry1.SQL.Insert(dm.qry1.SQL.Count,' HAVING  (CAST(ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice AS decimal(10, 2)) <= 0)');
//          ShowMessage(dm.qry1.SQL.Text);
             dm.qry1.Open;
            main_form:=Tmain_form.Create(application);
            main_form.ShowModal;
            main_form.free;
      end;
   2: begin
            for i:=1 to sgrid1.RowCount-2 do
              begin
                 if (sgrid1.Cells[0,i] = '现供应商')and (rg1.ItemIndex=1) then
                 begin
                   dm.qry1.SQL.Insert(i+24,sgrid1.Cells[2,i]);
                 end
                 else
                 begin
                   dm.qry1.SQL.Insert(22,sgrid1.Cells[2,i]);
                   dm.qry1.SQL.Insert(i+25,sgrid1.Cells[2,i]);
                 end;

              end;
        if CheckBox1.Checked then
            dm.qry1.SQL.Insert(dm.qry1.SQL.Count,' HAVING  (CAST(ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice AS decimal(10, 2)) > 0)')
        else
            dm.qry1.SQL.Insert(dm.qry1.SQL.Count,' HAVING  (CAST(ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice AS decimal(10, 2)) >= 0)');

            dm.qry1.Open;
            main_form:=Tmain_form.Create(application);
            main_form.ShowModal;
            main_form.free;
      end;
  end;
         { dm.qry1.Close;
          tempstring := dm.qry1.SQL.Text;
          dm.qry1.SQL.Insert(34,'where (1=1)');
          dm.qry1.Open;
          main_form:=Tmain_form.Create(application);
          main_form.ShowModal;
          main_form.free;}
end;

procedure TQty_form.update_sgrid(sgrid_row: byte);
begin
  sgrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
  sgrid1.Cells[1,sgrid_row]:=Edit1.Text;
     case ListBox1.ItemIndex of
     0:
           sgrid1.Cells[2,sgrid_row]:=' and Data0023.CODE  = '''+trim(Edit1.Text)+'''';
     1:
           sgrid1.Cells[2,sgrid_row]:=' and Data0017.INV_PART_NUMBER = '''+trim(Edit1.Text)+'''';
     2:
           sgrid1.Cells[2,sgrid_row]:=' and Data0017.INV_NAME = '''+trim(Edit1.Text)+'''';
//     3:
//          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d23.CODE = '''+trim(Edit1.Text)+'''';
//     4:
//          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d1.TAX_2 = '''+trim(Edit1.Text)+'''';
//     5:
//          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d1.CURR_CODE = '''+trim(Edit1.Text)+'''';
     3:
          sgrid1.Cells[2,sgrid_row]:=' and dbo.Data0496.GROUP_NAME = '''+trim(Edit1.Text)+'''';
     4:
//          sgrid1.Cells[2,sgrid_row]:=' and dbo.Data0019.inv_group_name = '''+trim(Edit1.Text)+'''';
          sgrid1.Cells[2,sgrid_row]:=' and dbo.Data0019.rkey in( '+rkey19+')';
     end;
end;

procedure TQty_form.Button1Click(Sender: TObject);
var
 i:byte;
begin
  if (Trim(Edit1.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex] then
  begin
     update_sgrid(i);
     exit;
  end;
  update_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
//
//    if (Edit1.Text ='') and (Edit1.Visible =true) then //条件值为空
//    begin
//          messagedlg('条件值不能为空!',mtinformation,[mbok],0);
//          exit;
//    end;
//
//    for i:=1 to sgrid1.RowCount-2 do
//      if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
//       begin
//        messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
//        exit;
//       end;
//
//     sgrid1.Cells[0,sgrid1.RowCount-1]:=ListBox1.Items[ListBox1.itemindex];
//     sgrid1.Cells[1,sgrid1.RowCount-1]:=Edit1.Text;
//     case ListBox1.ItemIndex of
//     0:
//           sgrid1.Cells[2,sgrid1.RowCount-1]:=' and Data0023.CODE  = '''+trim(Edit1.Text)+'''';
//     1:
//           sgrid1.Cells[2,sgrid1.RowCount-1]:=' and Data0017.INV_PART_NUMBER = '''+trim(Edit1.Text)+'''';
//     2:
//           sgrid1.Cells[2,sgrid1.RowCount-1]:=' and Data0017.INV_NAME = '''+trim(Edit1.Text)+'''';
////     3:
////          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d23.CODE = '''+trim(Edit1.Text)+'''';
////     4:
////          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d1.TAX_2 = '''+trim(Edit1.Text)+'''';
////     5:
////          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d1.CURR_CODE = '''+trim(Edit1.Text)+'''';
//     3:
//          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and dbo.Data0496.GROUP_NAME = '''+trim(Edit1.Text)+'''';
//     4:
//          sgrid1.Cells[2,sgrid1.RowCount-1]:=' and dbo.Data0019.inv_group_name = '''+trim(Edit1.Text)+'''';
//     end;
//     sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TQty_form.BitBtn4Click(Sender: TObject);
var inputvar:PDlgInput;
begin

    case ListBox1.ItemIndex of
      0: begin
              frmpick_item_single:=Tfrmpick_item_single.Create(application);
              Edit1.Text :='';
              inputvar.Fields := 'CODE/供应商代码/100,ABBR_NAME/供应商简称/100,SUPPLIER_NAME/供应商名称/300';
              inputvar.Sqlstr:='SELECT CODE ,ABBR_NAME, SUPPLIER_NAME FROM  dbo.Data0023 order by CODE';
              inputvar.KeyField:='CODE';
              inputvar.InPut_value:=edit1.Text;
              inputvar.AdoConn:=dm.con1;
              frmpick_item_single.InitForm_New(inputvar);
              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
              begin
                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['CODE']);
              end
              else edit1.SetFocus;
              frmpick_item_single.adsPick.Close;
              frmpick_item_single.Free;
          end;

      1: begin
              frmpick_item_single:=Tfrmpick_item_single.Create(application);
              Edit1.Text :='';
               inputvar.Fields := 'INV_PART_NUMBER/材料编码/100,INV_NAME/材料名称/100,INV_DESCRIPTION/材料规格/300';
              inputvar.Sqlstr:='SELECT  INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION FROM  dbo.Data0017 order by INV_PART_NUMBER';
              inputvar.KeyField:='INV_PART_NUMBER';
              inputvar.InPut_value:=edit1.Text;
              inputvar.AdoConn:=dm.con1;
              frmpick_item_single.InitForm_New(inputvar);
              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
              begin
                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['INV_PART_NUMBER']);
              end
              else edit1.SetFocus;
              frmpick_item_single.adsPick.Close;
              frmpick_item_single.Free;
          end;

      2: begin
              frmpick_item_single:=Tfrmpick_item_single.Create(application);
              Edit1.Text :='';
              inputvar.Fields := 'INV_NAME/材料名称/200,INV_PART_NUMBER/材料编码/100,INV_DESCRIPTION/材料规格/300';
              inputvar.Sqlstr:='SELECT   INV_NAME, INV_PART_NUMBER, INV_DESCRIPTION FROM  dbo.Data0017 order by INV_NAME';
              inputvar.KeyField:='INV_NAME';
              inputvar.InPut_value:=edit1.Text;
              inputvar.AdoConn:=dm.con1;
              frmpick_item_single.InitForm_New(inputvar);
              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
              begin
                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['INV_NAME']);
              end
              else edit1.SetFocus;
              frmpick_item_single.adsPick.Close;
              frmpick_item_single.Free;
         end;

//      3: begin
//              frmpick_item_single:=Tfrmpick_item_single.Create(application);
//              Edit1.Text :='';
//              inputvar.Fields := 'CODE/供应商代码/100,ABBR_NAME/供应商简称/100,SUPPLIER_NAME/供应商名称/300';
//              inputvar.Sqlstr:='SELECT CODE ,ABBR_NAME, SUPPLIER_NAME FROM  dbo.Data0023 order by CODE';
//              inputvar.KeyField:='CODE';
//              inputvar.InPut_value:=edit1.Text;
//              inputvar.AdoConn:=dm.con1;
//              frmpick_item_single.InitForm_New(inputvar);
//              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
//              begin
//                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['CODE']);
//              end
//              else edit1.SetFocus;
//              frmpick_item_single.adsPick.Close;
//              frmpick_item_single.Free;
//          end;
//
//       5: begin
//              frmpick_item_single:=Tfrmpick_item_single.Create(application);
//              Edit1.Text :='';
//              inputvar.Fields := 'CURR_CODE/货币代码/200,CURR_NAME/货币名称/300';
//              inputvar.Sqlstr:='SELECT     CURR_CODE, CURR_NAME FROM  dbo.Data0001 order by CURR_CODE';
//              inputvar.KeyField:='CURR_CODE';
//              inputvar.InPut_value:=edit1.Text;
//              inputvar.AdoConn:=dm.con1;
//              frmpick_item_single.InitForm_New(inputvar);
//              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
//              begin
//                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['CURR_CODE']);
//              end
//              else edit1.SetFocus;
//              frmpick_item_single.adsPick.Close;
//              frmpick_item_single.Free;
//          end;
      3: begin
              frmpick_item_single:=Tfrmpick_item_single.Create(application);
              Edit1.Text :='';
              inputvar.Fields := 'GROUP_NAME/材料类别编码/200,GROUP_DESC/材料类别名称/300';
              inputvar.Sqlstr:='SELECT  GROUP_NAME , GROUP_DESC  FROM  dbo.Data0496 order by GROUP_NAME';
              inputvar.KeyField:='GROUP_NAME';
              inputvar.InPut_value:=edit1.Text;
              inputvar.AdoConn:=dm.con1;
              frmpick_item_single.InitForm_New(inputvar);
              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
              begin
                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['GROUP_NAME']);
              end
              else edit1.SetFocus;
              frmpick_item_single.adsPick.Close;
              frmpick_item_single.Free;
          end;
      4: begin
//              frmpick_item_single:=Tfrmpick_item_single.Create(application);
//              Edit1.Text :='';
//              inputvar.Fields := 'inv_group_name/材料组别编码/200,inv_group_desc/材料组别名称/300';
//              inputvar.Sqlstr:='SELECT  inv_group_name , inv_group_desc  FROM  dbo.Data0019 order by inv_group_name';
//              inputvar.KeyField:='inv_group_name';
//              inputvar.InPut_value:=edit1.Text;
//              inputvar.AdoConn:=dm.con1;
//              frmpick_item_single.InitForm_New(inputvar);
//              if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
//              begin
//                 edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['inv_group_name']);
//              end
//              else edit1.SetFocus;
//              frmpick_item_single.adsPick.Close;
//              frmpick_item_single.Free;
            try
              frm_Inv_Group_Select:=Tfrm_Inv_Group_Select.Create(Application);
              Edit1.Text :='';
              rkey19 :='';
              if frm_Inv_Group_Select.ShowModal=mrok then
              begin
                frm_Inv_Group_Select.ADS19.First;
                while not frm_Inv_Group_Select.ADS19.Eof do
                begin
//                  SGrid1.Cells[0,SGrid1.RowCount-1]:=frm_Inv_Group_Select.ADS19inv_group_name.Value;
//                  SGrid1.Cells[1,SGrid1.RowCount-1]:=frm_Inv_Group_Select.ADS19inv_group_desc.AsString;
//                  SGrid1.Cells[2,SGrid1.RowCount-1]:=frm_Inv_Group_Select.ads19rkey.AsString;
//                  SGrid1.RowCount:=SGrid1.RowCount+1;
                  if frm_Inv_Group_Select.ADS19.RecordCount=frm_Inv_Group_Select.ADS19.RecNo then
                  begin
                    Edit1.Text:=Edit1.Text+frm_Inv_Group_Select.ADS19inv_group_name.Value;
                    rkey19 :=rkey19 + frm_Inv_Group_Select.ADS19rkey.asstring;
                  end
                  else
                  begin
                    Edit1.Text:=Edit1.Text+frm_Inv_Group_Select.ADS19inv_group_name.Value+',';
                    rkey19 :=rkey19 + frm_Inv_Group_Select.ADS19rkey.asstring+',';
                  end;
//                  ShowMessage(rkey19);
                  frm_Inv_Group_Select.ADS19.Next;
                end;
              end;

            finally
              frm_Inv_Group_Select.Free;
            end;
          end;
    end;
end;

procedure TQty_form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
//     case listbox1.ItemIndex of
//          0,1,2,3,5,6,7 : abort;
//          4: begin
//                 if not (key in ['0'..'9',#8,#13,#46]) then
//                      abort;
//                 if (key=#46) and (Pos(#46,Edit1.Text)>0) then
//                      Abort;
//              end;
//      end;
end;


procedure TQty_form.rg1Click(Sender: TObject);
begin
  if rg1.ItemIndex=0 then
  begin
    SQLINI := 'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0496.GROUP_DESC, '
              + #13#10 +
              '  dbo.Data0019.inv_group_desc, dbo.Data0023.ABBR_NAME, ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) AS avg_price, '
              + #13#10 +
              '  SUM(dbo.Data0022.QUANTITY) AS total_qty, case when derivedtbl_1.oldavgprice=0 then ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) else derivedtbl_1.oldavgprice end as oldavgprice,'
              + #13#10 +
              '   CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE ROUND(AVG(dbo.Data0022.tax_price *  dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice end AS decimal(10, 2)) AS ud_price,  '
              + #13#10 +
              '  CAST(CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE (ROUND(AVG (dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice)  / derivedtbl_1.oldavgprice * 100 END AS decimal(10, 2)) AS VARCHAR (100)) + ''%'' AS ud_percent,  '
              + #13#10 +
              ' CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE (ROUND(AVG(dbo.Data0022.tax_price *  dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice) * SUM(dbo.Data0022.QUANTITY) end AS decimal(10,  2))  AS total_updown '
              + #13#10 + 'FROM         dbo.Data0022 INNER JOIN' +
              #13#10 +
              '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'
              + #13#10 +
              '                      dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey LEFT OUTER JOIN'
              + #13#10 +
              '                          (SELECT     Data0023.ABBR_NAME AS old_abbrname, Data0022.INVENTORY_PTR, CAST(SUBSTRING(MAX(CONVERT(varchar, Data0456.ship_DATE, 101) '
              + #13#10 +
              '                                                   + STR(Data0022.tax_price * Data0456.exch_rate, 10, 2)), 11, 10) AS decimal(10, 2)) AS oldavgprice'
              + #13#10 +
              '                            FROM          dbo.Data0022  INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0017  ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0456  ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0023  ON Data0456.SUPP_PTR = Data0023.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0496 ON Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'
              + #13#10 +
              '                                                   dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey '
              + #13#10 +
              '                            WHERE      (1 = 1) AND (Data0456.ship_DATE >= '+ QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk1.date))+') AND (Data0456.ship_DATE <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk2.date))+')'
              + #13#10 +
              '                            GROUP BY Data0023.ABBR_NAME, Data0022.INVENTORY_PTR) AS derivedtbl_1 ON dbo.Data0022.INVENTORY_PTR = derivedtbl_1.INVENTORY_PTR '
              + #13#10 +
              '                           AND dbo.Data0023.ABBR_NAME = derivedtbl_1.old_abbrname' 
              + #13#10 +
              'WHERE     (1 = 1) AND (dbo.Data0456.ship_DATE >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk3.date))+') AND (dbo.Data0456.ship_DATE <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk4.date))+')'
              + #13#10 +
              'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, '
              + #13#10 +
              '                      dbo.Data0017.RKEY, dbo.Data0496.GROUP_DESC, dbo.Data0019.inv_group_desc, derivedtbl_1.oldavgprice';
  end
  else
  begin
    SQLINI:='SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0496.GROUP_DESC, '
      + #13#10 +
      '                      dbo.Data0019.inv_group_desc, dbo.Data0023.ABBR_NAME, ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) AS avg_price, '
      + #13#10 +
      '  SUM(dbo.Data0022.QUANTITY) AS total_qty, case when derivedtbl_1.oldavgprice=0 then ROUND(AVG(dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) else derivedtbl_1.oldavgprice end as oldavgprice,'
      + #13#10 +
      '   CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE ROUND(AVG(dbo.Data0022.tax_price *  dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice end AS decimal(10, 2)) AS ud_price,  '
      + #13#10 +
      '  CAST(CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE (ROUND(AVG (dbo.Data0022.tax_price * dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice)  / derivedtbl_1.oldavgprice * 100 END AS decimal(10, 2)) AS VARCHAR (100)) + ''%'' AS ud_percent,  '
      + #13#10 +
      ' CAST(CASE derivedtbl_1.oldavgprice WHEN 0 THEN 0 ELSE (ROUND(AVG(dbo.Data0022.tax_price *  dbo.Data0456.exch_rate), 2) - derivedtbl_1.oldavgprice) * SUM(dbo.Data0022.QUANTITY) end AS decimal(10,  2))  AS total_updown '
      + #13#10 + 'FROM         dbo.Data0022 INNER JOIN' + #13#10 +
      '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
      + #13#10 + 
      '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'
      + #13#10 + 
      '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
      + #13#10 + 
      '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'
      + #13#10 + 
      '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'
      + #13#10 + 
      '                      dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey LEFT OUTER JOIN'
      + #13#10 + 
      '                          (SELECT      Data0022.INVENTORY_PTR, CAST(SUBSTRING(MAX(CONVERT(varchar, Data0456.ship_DATE, 101) '
      + #13#10 + 
      '                                                   + STR(Data0022.tax_price * Data0456.exch_rate, 10, 2)), 11, 10) AS decimal(10, 2)) AS oldavgprice'
      + #13#10 + 
      '                            FROM          dbo.Data0022  INNER JOIN'
      + #13#10 + 
      '                                                   dbo.Data0017  ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN'
      + #13#10 + 
      '                                                   dbo.Data0456  ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'
      + #13#10 + 
      '                                                  -- dbo.Data0023 AS d23 ON Data0456.SUPP_PTR = d23.RKEY INNER JOIN'
      + #13#10 + 
      '                                                   dbo.Data0496 ON Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'
      + #13#10 + 
      '                                                   dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey '
      + #13#10 + 
      '                            WHERE      (1 = 1) AND (Data0456.ship_DATE >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk1.date))+') AND (Data0456.ship_DATE <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk2.date))+')'
      + #13#10 +
      '                            GROUP BY  Data0022.INVENTORY_PTR) AS derivedtbl_1 ON dbo.Data0022.INVENTORY_PTR = derivedtbl_1.INVENTORY_PTR '
      + #13#10 + '                           ' + #13#10 + 
      'WHERE     (1 = 1) AND (dbo.Data0456.ship_DATE >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk3.date))+') AND (dbo.Data0456.ship_DATE <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dtpk4.date))+')'
      + #13#10 +
      'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.Data0023.ABBR_NAME, '
      + #13#10 +
      '                      dbo.Data0017.RKEY, dbo.Data0496.GROUP_DESC, dbo.Data0019.inv_group_desc, derivedtbl_1.oldavgprice';

  end;
end;





end.
