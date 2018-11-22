unit IQC_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ExtCtrls, Mask, DBCtrls;

type
  TForm_IQC = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    Edit2: TEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label11: TLabel;
    ComboBox1: TComboBox;
    dbeditQUAN_ON_HAND: TDBEdit;
    lbl1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
   v_date,v_date1: tdatetime;

   rkey15:array of integer;
   procedure insert_data0022(rkey:integer;quantity_:string);
    { Private declarations }
  public
   iRKey:Integer;
   v_count :integer;
   v_edit3,v_edit4 :double ;
    { Public declarations }
  end;

var
  Form_IQC: TForm_IQC;

implementation
uses damo,main,bug_form,common;
{$R *.dfm}


procedure TForm_IQC.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_IQC.N1Click(Sender: TObject);
begin
  try
    form_bug:=tform_bug.Create(application);
    if form_bug.Edit1.Enabled=false then form_bug.Edit1.Enabled:=true;
    form_bug.ShowModal;
  finally
    form_bug.Free;
  end;
end;

procedure TForm_IQC.N3Click(Sender: TObject);
var
  i:Integer;
begin
  if messagedlg('确定要删除此记录吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
    if sgrid1.Cells[0,sgrid1.Row]='报废' then
      form_IQC.Edit3.Text :=floattostr(Strtofloat(form_IQC.Edit3.Text) -strtofloat(sgrid1.Cells[1,sgrid1.Row]))
    else
      form_IQC.Edit4.Text := floattostr(Strtofloat(form_IQC.Edit4.Text)-strtofloat(sgrid1.Cells[1,sgrid1.Row]));

    for i:=sgrid1.Row to sgrid1.RowCount-2 do
      sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;

    sgrid1.RowCount:=sgrid1.RowCount-1;
  end ;
end;


procedure TForm_IQC.insert_data0022(rkey: integer;quantity_:string);
begin
 with dm.tmp do
 begin
   SQL.Clear;
   sql.Text:='INSERT INTO data0022(INVENTORY_PTR,GRN_PTR,SOURCE_PTR,SUPPLIER_PTR,'+
             'LOCATION_PTR,QUANTITY,PRICE,DISCOUNT,TTYPE,TDATE,STATUS,LOCATION_PTR_FROM,'+
             'PACKING_SLIP_FLAG,QUAN_STOCKED,QUAN_ISSUED_TO_FACT,QUAN_RTNED_FM_FACT,'+
             'QUAN_ON_HAND,BARCODE_ID,EXPIRE_DATE,SUPPLIER2,TAX_2,rohs,tax_price,cust_decl,'+
             'STOCK_BASE,GL_HEADER_PTR,GLPTR_STATUS,spec_place,rkey391,D0134_PTR,IF_SEND) '+

             'SELECT INVENTORY_PTR,GRN_PTR,SOURCE_PTR,SUPPLIER_PTR,'+inttostr(rkey15[combobox1.ItemIndex])+
             ' as LOCATION_PTR,'+quantity_+' as QUANTITY,'+
             'PRICE,DISCOUNT,'+
             'TTYPE,TDATE,STATUS,LOCATION_PTR_FROM,PACKING_SLIP_FLAG,QUAN_STOCKED,'+
             'QUAN_ISSUED_TO_FACT,QUAN_RTNED_FM_FACT,'+quantity_+'as QUAN_ON_HAND,BARCODE_ID,'+
             QuotedStr(FormatDateTime('YYYY-MM-DD',dm.ADO022EXPIRE_DATE.Value))+' as EXPIRE_DATE,SUPPLIER2,'+
             'TAX_2,rohs,tax_price,cust_decl,STOCK_BASE,GL_HEADER_PTR,GLPTR_STATUS,spec_place,rkey391,'+
             'D0134_PTR,IF_SEND FROM Data0022 WHERE RKEY= '+inttostr(rkey);
   ExecSQL;
 end;
end;

procedure TForm_IQC.Button1Click(Sender: TObject);
var
 i:integer;
begin

  if strtocurr(edit2.Text)<>strtocurr(edit1.Text)+strtocurr(edit3.Text)+strtocurr(edit4.Text) then
  begin
    showmessage('品检数与待检数不等,请注意数量关系...');
    exit;
  end;
  if messagedlg('此过程不可逆,您确定吗?',mtconfirmation,[mbyes,mbno],1)=mrno then exit;
  try


    dm.ADOConnection1.BeginTrans;
    dm.ADOData0095.Open;
    dm.ADOData0096.Open;
    for i:=v_count+1 to sgrid1.RowCount-2 do
    begin
      if sgrid1.Cells[0,i]='报废'  then
      begin
        with dm.ADOData0095 do
        begin
          append;
          dm.ADOData0095TRAN_TP.Value:=9;
          dm.ADOData0095INVT_PTR.Value:=dm.ADO022INVENTORY_PTR.Value;//17rkey
          dm.ADOData0095SRCE_PTR.Value:=dm.ADO022RKEY.Value;
          dm.ADOData0095TRAN_BY.AsString:=user_ptr;
          dm.ADOData0095TRAN_DATE.Value:=v_date; //时间
          dm.ADOData0095QUANTITY.AsString:=sgrid1.Cells[1,i];//报废数量
          post;
        end;
        with  dm.ADOData0096 do
        begin
          append;
          dm.ADOData0096FLAG.Value:='1';
          dm.ADOData0096INVT_PTR.Value:=dm.ADO022INVENTORY_PTR.Value;
          dm.ADOData0096REJ_PTR.AsString:=sgrid1.Cells[4,i]; //缺陷
          dm.ADOData0096INV_TRAN_PTR.Value:=dm.ADO022RKEY.Value;
          dm.ADOData0096EMPL_PTR.AsString:=user_ptr;
          dm.ADOData0096TDATE.Value:=v_date;
          dm.ADOData0096QUAN_REJD.AsString:=sgrid1.Cells[1,i];
          post;
        end;
      end
      else //退货给供应商
      begin
        with  dm.ADOData0096 do
        begin
          append;
          dm.ADOData0096FLAG.Value:='2';
          dm.ADOData0096INVT_PTR.Value:=dm.ADO022INVENTORY_PTR.Value;
          dm.ADOData0096REJ_PTR.AsString:=sgrid1.Cells[4,i];
          dm.ADOData0096INV_TRAN_PTR.Value:=dm.ADO022RKEY.Value;
          dm.ADOData0096EMPL_PTR.AsString:=user_ptr;
          dm.ADOData0096TDATE.Value:=v_date;
          dm.ADOData0096QUAN_REJD.AsString:=sgrid1.Cells[1,i];
          post;
        end;
      end ;
    end;//对应for语句中的begin语句

    with dm.ADO022 do
    begin
      edit;
      dm.ADO022QUAN_SCRAPPED.AsFloat:=dm.ADO022QUAN_SCRAPPED.Value+strtofloat(edit3.Text); //报废数
      dm.ADO022QUAN_TO_BE_SHIPPED.Value:=dm.ADO022QUAN_TO_BE_SHIPPED.Value+StrToFloat(edit4.Text); //退供应商数
      dm.ADO022QUAN_IN_INSP.Value:=0;
      if (strtofloat(Edit1.Text)=0) then
      begin
       if not DBEdit7.Field.IsNull then
       dm.ADO022EXPIRE_DATE.Value:=v_date1
      end
      else
      if (dm.ADO022QUAN_ON_HAND.AsInteger =0) then
       begin
        dm.ADO022QUAN_ON_HAND.Value:=dm.ADO022QUAN_ON_HAND.Value+strtofloat(Edit1.Text);     //可用数(退仓)
        dm.ADO022LOCATION_PTR.Value:=self.rkey15[combobox1.ItemIndex];
       end
      else
      begin
       dm.ADO022QUANTITY.Value:= dm.ADO022QUANTITY.Value-strtofloat(Edit1.Text);           //日期不变
       self.insert_data0022(dm.ADO022RKEY.Value,Trim(Edit1.Text));  //插入22一条新记录
       dm.ADO022EXPIRE_DATE.Value:=v_date1;
      end;
      post;
    end;

    //*********************************************************//
    if strtofloat(edit1.Text)>0 then
    begin
      with dm.ADOData0095 do
      begin
        append;
        dm.ADOData0095TRAN_TP.Value:=10;
        dm.ADOData0095INVT_PTR.Value:=dm.ADO022INVENTORY_PTR.Value;
        dm.ADOData0095SRCE_PTR.Value:=dm.ADO022RKEY.Value;
        dm.ADOData0095TRAN_BY.AsString:=user_ptr;
        dm.ADOData0095TRAN_DATE.Value:=v_date;
        dm.ADOData0095QUANTITY.AsString:=edit1.Text;
        post;
      end;
      with dm.ADOData0017 do
      begin
        close;
        dm.ADOData0017.Parameters[0].Value:=dm.ADO022INVENTORY_PTR.Value;
        open;
        edit;
        dm.ADOData0017QUAN_ON_HAND.Value:=dm.ADOData0017QUAN_ON_HAND.Value+strtofloat(edit1.Text);
        post;
      end;
    end;
    //**************************************************************//
    dm.ADOConnection1.CommitTrans;
    dm.ADO022.Close;
    dm.ADO022.Open;
    modalresult:=mrok;
  except
    on e: exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      dm.ADO022.Cancel;
      messagedlg(e.Message,mtwarning,[mbcancel],0);
    end;
  end;

end;

procedure TForm_IQC.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then   //判断右键
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0)and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
 end;
end;

procedure TForm_IQC.Edit1Exit(Sender: TObject);
var flag :double;
begin
 if  (edit1.Text='')and (ActiveControl.Name<>'button2') then
 begin
 messagedlg('请输入送交入仓数量!',mtconfirmation,[mbok],0);
 edit1.Text:='0';
 edit1.SetFocus;
 end
 else
 if (strtofloat(edit2.Text)-strtofloat(edit1.Text)-strtofloat(edit3.Text)
     -strtofloat(edit4.Text)+v_edit3+v_edit4)<0 then
  begin
   flag:=(strtofloat(edit2.Text)-strtofloat(edit3.Text)
         -strtofloat(edit4.Text)+v_edit3+v_edit4);
   messagedlg('可使用数量最多为'+floattostr(flag),mtconfirmation,[mbok],0);
   edit1.Text:='0';
   edit1.SetFocus;
  end ;
end;

procedure TForm_IQC.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8,#13]) then abort
else
 if key=chr(46) then
   if pos('.',edit1.Text)>0 then abort;
end;

procedure TForm_IQC.FormShow(Sender: TObject);
var
 i:byte;
begin

  sgrid1.Cells[0,0]:='处理方式';
  sgrid1.Cells[1,0]:='数量';
  sgrid1.Cells[2,0]:='缺陷代码';
  sgrid1.Cells[3,0]:='缺陷描述';
  sgrid1.Cells[4,0]:='76rkey';
  sgrid1.ColWidths[4]:=0;

  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey,location from data0016 WHERE (LOCATION_TYPE = 0) and (whouse_ptr=:whouse_ptr)');
    Parameters.ParamByName('whouse_ptr').Value:=iRKey;
    open;
    setlength(rkey15,RecordCount);
  end;
  i:=0;
  while not dm.tmp.Eof do
  begin
    ComboBox1.Items.Add(dm.tmp.FieldValues['location']);
    rkey15[i]:=dm.tmp.fieldbyname('rkey').AsInteger;
    inc(i);
    dm.tmp.Next;
  end;
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.ADO022LOCATION.Value);
  Edit2.Text:=dm.ADO022QUAN_IN_INSP.AsString;
  with dm.tmp do
  begin
    close;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    open;
    v_date:=dm.tmp.FieldValues['v_dt'];
  end ;
end;

procedure TForm_IQC.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 if (arow<=v_count) and (arow>0) then
 begin
  sGrid1.Canvas.Brush.Color:=clskyblue ;
  SGrid1.Canvas.FillRect(rect);
  SGrid1.Canvas.TextRect(rect,rect.left,rect.Top, SGrid1.Cells[acol,aRow]);
 end;
end;

procedure TForm_IQC.PopupMenu1Popup(Sender: TObject);
begin
  n3.Enabled:=SGrid1.RowCount>2;
end;

procedure TForm_IQC.FormActivate(Sender: TObject);
begin
 v_date1:=dm.ADO022EXPIRE_DATE.Value;
end;


end.
