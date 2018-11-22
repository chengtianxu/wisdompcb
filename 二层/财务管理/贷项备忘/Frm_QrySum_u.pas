unit Frm_QrySum_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ComCtrls, ExtCtrls, Grids, StdCtrls, Buttons,
  dateutils;

type
  TFrm_QrySum = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup2: TRadioGroup;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    grpstatus: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row: byte);    
  public
    { Public declarations }
  end;

var
  Frm_QrySum: TFrm_QrySum;

implementation

uses common,Frm_detail_u,Pick_Item_Single,ConstVar,DAMO;

{$R *.dfm}

procedure TFrm_QrySum.FormCreate(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=getsystem_date(DM.tmp,1);
  dtpk1.Date:=dtpk2.Date-dayof(dtpk2.Date)+1;
  ListBox3.ItemIndex:=0;
end;

procedure TFrm_QrySum.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_QrySum.ListBox3Click(Sender: TObject);
begin
  label8.Caption:=listbox3.Items[listbox3.itemindex];
  edit3.Text:='';
  edit3.Visible:=listbox3.ItemIndex=0;
  button3.Enabled:=listbox3.ItemIndex in [1,2];

  bitbtn6.Visible:=listbox3.ItemIndex=0;
  RadioButton1.Checked:=true;
  RadioButton4.Visible:=listbox3.ItemIndex=0;
  GroupBox1.Visible:=edit3.Visible;
  GroupBox2.Visible:=listbox3.ItemIndex=1;
  grpstatus.Visible:=listbox3.ItemIndex=2;

end;

procedure TFrm_QrySum.Edit3Change(Sender: TObject);
begin
  button3.Enabled:=trim(edit3.Text)<>'' ;
end;

procedure TFrm_QrySum.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySum.BitBtn2Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TFrm_QrySum.update_sgrid(sgrid_row: byte);
  procedure Con(s:string);
  begin
    if RadioButton1.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton1.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' = '''+edit3.Text+''' ';
    end else if RadioButton2.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton2.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' <> '''+edit3.Text+''' ';
    end else if RadioButton4.Checked then
    begin
     sgrid1.Cells[1,sgrid_row]:=RadioButton4.Caption+edit3.Text;
     sgrid1.Cells[2,sgrid_row]:=s+' like ''%'+edit3.Text+'%'' ';
    end ;
  end;
var s,s1:string;
begin
  sgrid1.Cells[0,sgrid_row]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex=0 then
  begin
    sgrid1.Cells[1,sgrid_row]:=edit3.Text;
    Con('and data0010.cust_code');
  end else if listbox3.itemindex=1  then begin
    if CheckBox1.Checked then begin s:=CheckBox1.Caption; s1:='1';end;
    if CheckBox2.Checked then
    begin
      if s='' then begin s:=CheckBox2.Caption;s1:='4';end else begin s:=s+','+CheckBox2.Caption;s1:=s1+',4';end;
    end;
    if CheckBox3.Checked then
    begin
      if s='' then begin s:=CheckBox3.Caption;s1:='3';end else begin s:=s+','+CheckBox3.Caption;s1:=s1+',3';end;
    end;
    sgrid1.Cells[1,sgrid_row]:=s;
    sgrid1.Cells[2,sgrid_row]:=' and data0116.memo_tp in ('+s1+')';
  end else begin
    if chk1.Checked then begin s:=chk1.Caption; s1:='1';end;
    if chk2.Checked then
    begin
      if s='' then begin s:=chk2.Caption;s1:='2';end else begin s:=s+','+chk2.Caption;s1:=s1+',2';end;
    end;
    if chk3.Checked then
    begin
      if s='' then begin s:=chk3.Caption;s1:='3';end else begin s:=s+','+chk3.Caption;s1:=s1+',3';end;
    end;
    sgrid1.Cells[1,sgrid_row]:=s;
    sgrid1.Cells[2,sgrid_row]:=' and Data0116.memo_status in (' + s1 + ')';
  end;
end;

procedure TFrm_QrySum.Button3Click(Sender: TObject);
var i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
  begin
    self.update_sgrid(i);
    exit;
  end;
 self.update_sgrid(sgrid1.RowCount-1);
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_QrySum.BitBtn6Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case self.ListBox3.ItemIndex of
    0:
    begin
      InputVar.Fields:='CUST_CODE/客户代码/110,CUSTOMER_NAME/客户名称/251,abbr_name/简称/125';
      InputVar.Sqlstr:='SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'+
                         'data0010.abbr_name FROM dbo.Data0010  order  by cust_code';
      inputvar.KeyField:='CUST_CODE';
    end;
  end;
  inputvar.InPut_value:=edit3.Text;
  InputVar.AdoConn := DM.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
    button3.SetFocus;
  end else
    edit3.SetFocus;
 finally
   frmPick_Item_Single.Free ;
 end;
 
end;

procedure TFrm_QrySum.BitBtn1Click(Sender: TObject);
var i:integer;
    select,where,group,order:string;
begin
 try
  screen.Cursor:=crappstart;
  case radiogroup1.ItemIndex of
   0:     //date
    begin
      if RadioGroup2.ItemIndex=0 then
      begin
        select:='SELECT Data0116.MEMO_DATE,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE,sum(Data0116.AMOUNT) AMOUNT '+
                'FROM dbo.Data0116 INNER JOIN '+
                      'dbo.Data0001 ON dbo.Data0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
                      'dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY left JOIN '+
                      'dbo.Data0105 ON dbo.Data0116.RKEY = dbo.Data0105.SOURCE_PTR AND '+
                      'dbo.Data0105.TRANS_TYPE = 7 AND data0105.status<>5'+
                'WHERE 1=1 ';
     group:=' GROUP BY Data0116.MEMO_DATE,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE ';
     order:=' ORDER BY Data0116.MEMO_DATE';
     end else begin
        select:='SELECT Data0116.RMA_DATE,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE,sum(Data0116.AMOUNT) AMOUNT '+
                'FROM dbo.Data0116 INNER JOIN '+
                      'dbo.Data0001 ON dbo.Data0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
                      'dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY LEFT JOIN '+
                      'dbo.Data0105 ON dbo.Data0116.RKEY = dbo.Data0105.SOURCE_PTR AND '+
                      'dbo.Data0105.TRANS_TYPE = 7 AND data0105.status<>5 '+
                'WHERE 1=1 ';
     group:=' GROUP BY Data0116.RMA_DATE,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE ';
     order:=' ORDER BY Data0116.RMA_DATE';
     end;
    end;
   1:     //Month
    begin
      if RadioGroup2.ItemIndex=0 then
      begin
        select:='SELECT datepart(yy,Data0116.MEMO_DATE)*100+datepart(mm,Data0116.MEMO_DATE) M,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE,sum(Data0116.AMOUNT) AMOUNT '+
                'FROM dbo.Data0116 INNER JOIN '+
                      'dbo.Data0001 ON dbo.Data0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
                      'dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY left JOIN '+
                      'dbo.Data0105 ON dbo.Data0116.RKEY = dbo.Data0105.SOURCE_PTR AND '+
                      'dbo.Data0105.TRANS_TYPE = 7 AND data0105.status<>5 '+
                'WHERE 1=1 ';
     group:=' GROUP BY datepart(yy,Data0116.MEMO_DATE)*100+datepart(mm,Data0116.MEMO_DATE),dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE ';
     order:=' ORDER BY datepart(yy,Data0116.MEMO_DATE)*100+datepart(mm,Data0116.MEMO_DATE)';
     end else begin
        select:='SELECT datepart(yy,Data0116.RMA_DATE)*100+datepart(mm,Data0116.MEMO_DATE) M,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE,sum(Data0116.AMOUNT) AMOUNT '+
                'FROM dbo.Data0116 INNER JOIN '+
                      'dbo.Data0001 ON dbo.Data0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
                      'dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY LEFT JOIN '+
                      'dbo.Data0105 ON dbo.Data0116.RKEY = dbo.Data0105.SOURCE_PTR AND '+
                      'dbo.Data0105.TRANS_TYPE = 7 AND data0105.status<>5 '+
                'WHERE 1=1 ';
     group:=' GROUP BY datepart(yy,Data0116.RMA_DATE)*100+datepart(mm,Data0116.MEMO_DATE),dbo.Data0001.CURR_CODE,dbo.Data0116.EX_RATE ';
     order:=' ORDER BY datepart(yy,Data0116.RMA_DATE)*100+datepart(mm,Data0116.MEMO_DATE)';
     end;
    end;

   2:     //cust
    begin
      select:='SELECT dbo.Data0010.CUST_CODE,dbo.Data0010.ABBR_NAME,dbo.Data0001.CURR_CODE,  dbo.Data0116.EX_RATE,sum(Data0116.AMOUNT) AMOUNT '+
              'FROM dbo.Data0116 INNER JOIN '+
                    'dbo.Data0001 ON dbo.Data0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
                    'dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY LEFT JOIN '+
                    'dbo.Data0105 ON dbo.Data0116.RKEY = dbo.Data0105.SOURCE_PTR AND '+
                    'dbo.Data0105.TRANS_TYPE = 7 AND data0105.status<>5 '+
              'WHERE 1=1 ';
     group:=' GROUP BY dbo.Data0010.CUST_CODE,dbo.Data0010.ABBR_NAME,dbo.Data0001.CURR_CODE,dbo.Data0116.EX_RATE ';
     order:=' ORDER BY dbo.Data0010.CUST_CODE';
    end;

   3:     //Acount
    begin
      select:='SELECT dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTION, dbo.Data0106.DESCRIPTION,dbo.Data0001.CURR_CODE,dbo.Data0116.EX_RATE,sum(Data0116.AMOUNT) AMOUNT '+
              'FROM dbo.Data0116 INNER JOIN '+
                    'dbo.Data0001 ON dbo.Data0116.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN '+
                    'dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY LEFT JOIN '+
                    'dbo.Data0105 ON dbo.Data0116.RKEY = dbo.Data0105.SOURCE_PTR AND '+
                    'dbo.Data0105.TRANS_TYPE = 7 AND data0105.status<>5 '+
                    'LEFT join data0106 on dbo.Data0106.GL_HEADER_PTR = dbo.Data0105.RKEY '+
                    'LEFT JOIN dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY '+
              'WHERE 1=1 ';
     group:=' GROUP BY  dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTION, dbo.Data0106.DESCRIPTION,dbo.Data0001.CURR_CODE,dbo.Data0116.EX_RATE ';
     order:=' ORDER BY dbo.Data0103.GL_ACC_NUMBER';
    end;
 end;

  where:='';
  for i:=1 to sgrid1.RowCount-2 do  where:=where+sgrid1.Cells[2,i]+' ';
  if RadioGroup2.ItemIndex=0 then
     where:=where+' and Data0116.MEMO_DATE >='''+formatdatetime('yyyy-mm-dd',dtpk1.Date)+
            ''' and Data0116.MEMO_DATE <='''+formatdatetime('yyyy-mm-dd',dtpk2.Date) +''''
  else
     where:=where+' and Data0116.RMA_DATE >='''+formatdatetime('yyyy-mm-dd',dtpk1.Date)+
            ''' and Data0116.RMA_DATE <='''+formatdatetime('yyyy-mm-dd',dtpk2.Date)+'''';

  Frm_detail:=TFrm_detail.Create(nil);
  Frm_detail.ADOQuery1.Close;
  Frm_detail.ADOQuery1.SQL.Text:=select+where+group+order;
  Frm_detail.ADOQuery1.Open;
  Frm_detail.ttype:=RadioGroup1.ItemIndex;
  Frm_detail.ttype_name:=radiogroup1.Items[radiogroup1.itemindex];
  screen.Cursor:=crdefault;
  Frm_detail.ShowModal;
 finally
  Frm_detail.Free;
 end;
 
end;

procedure TFrm_QrySum.CheckBox1Click(Sender: TObject);
begin
  Button3.Enabled:=CheckBox1.Checked or CheckBox2.Checked or CheckBox3.Checked;
end;

end.
