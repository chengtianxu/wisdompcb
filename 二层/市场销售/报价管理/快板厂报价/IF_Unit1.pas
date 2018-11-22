unit IF_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids,DateUtils
  ;

type
  TIf_Form1 = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    Label7: TLabel;
    dtpk4: TDateTimePicker;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    dtpk3: TDateTimePicker;
    Label2: TLabel;
    Label6: TLabel;
    BitBtn8: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vparametersvalue1:string;
    vparametersvalue2:string;
    vparametersvalue3:string;
    vparametersvalue4:string;
    vparametersvalue5:string;
    vparametersvalue6:string;
    vparametersvalue7:string;
    procedure update2_sgrid(sgrid_row:integer);
    procedure update_sgrid();
    function Get_parametersvalue1: string;
    function Get_parametersvalue2: string;
    function Get_parametersvalue3: string;
    function Get_parametersvalue4: string;
    function Get_parametersvalue5: string;
    function Get_parametersvalue6: string;
    function Get_parametersvalue7: string;
  public
    { Public declarations }
    property parametersvalue1:string read Get_parametersvalue1;
    property parametersvalue2:string read Get_parametersvalue2;
    property parametersvalue3:string read Get_parametersvalue3;
    property parametersvalue4:string read Get_parametersvalue4;
    property parametersvalue5:string read Get_parametersvalue5;
    property parametersvalue6:string read Get_parametersvalue6;
    property parametersvalue7:string read Get_parametersvalue7;



  end;

var
  If_Form1: TIf_Form1;

implementation

uses
   find_SALES_ORDER_Unit2
   ,find_CUT_NO_Unit2
   ,find_CUSTOMER_PART_DESC_Unit2
   ,find_CUST_CODE_Unit2
   ,find_CUSTOMER_PART_NUMBER_Unit2;

{$R *.dfm}

procedure TIf_Form1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TIf_Form1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
   sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TIf_Form1.BitBtn6Click(Sender: TObject);
begin
  modalresult:=mrCancel	;
end;

procedure TIf_Form1.BitBtn3Click(Sender: TObject);
var
 i:integer;
 n1,n2,n0,n3,n4,n5,n6,n7:integer;
begin
  {if sgrid1.RowCount=2 then
      if MessageDlg('没有定义查询条件，是否要定义查询条件?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          exit;
        end;
  {}
  hide;
  {
  vparametersvalue1:='';
  vparametersvalue2:='';
  vparametersvalue3:='';
  vparametersvalue4:='';
  vparametersvalue5:='';
  vparametersvalue6:='';
  vparametersvalue7:='';
  for i:=1 to sgrid1.RowCount-2  do
  begin
    //showmessage(sgrid1.Cells[2,i]);
    n0:=length(trim(sgrid1.Cells[2,i]));
    n1:=length(vparametersvalue1);
    if n1+n0<99 then
    begin
      vparametersvalue1:=vparametersvalue1+' '+trim(sgrid1.Cells[2,i]);
    end
    else
    begin
      n2:=length(vparametersvalue2);
      if n2+n0<99 then
      begin
         vparametersvalue2:=vparametersvalue2+' '+trim(sgrid1.Cells[2,i]);
      end
      else
      begin
        n3:=length(vparametersvalue3);
        if n3+n0<99 then
        begin
           vparametersvalue3:=vparametersvalue3+' '+trim(sgrid1.Cells[2,i]);
        end
        else
        begin
          n4:=length(vparametersvalue4);
          if n4+n0<99 then
              begin
                 vparametersvalue4:=vparametersvalue4+' '+trim(sgrid1.Cells[2,i]);
              end
          else
          begin
            n5:=length(vparametersvalue5);
            if n5+n0<99 then
                begin
                   vparametersvalue5:=vparametersvalue5+' '+trim(sgrid1.Cells[2,i]);
                end
            else
            begin
              n6:=length(vparametersvalue6);
              if n6+n0<99 then
                  begin
                     vparametersvalue6:=vparametersvalue6+' '+trim(sgrid1.Cells[2,i]);
                  end
              else
              begin
                n7:=length(vparametersvalue7);
                if n7+n0<99 then
                begin
                   vparametersvalue7:=vparametersvalue7+' '+trim(sgrid1.Cells[2,i]);
                end
                else
                begin
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  //showmessage(v1+' '+v2);
  {}
  modalresult:=mrok;
end;

procedure TIf_Form1.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 //只允许删除倒数第一行之前的行
 if sgrid1.Row=sgrid1.RowCount-1 then
   bitbtn4.Enabled:=false
 else
   bitbtn4.Enabled:=true;
end;

procedure TIf_Form1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0) and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
 end;
end;

procedure TIf_Form1.update2_sgrid(sgrid_row: integer);
begin
 case listbox2.ItemIndex of
 0:begin //订单号
    //更新1列记录　
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    //更新2列记录，用于向存取过程输入参数用的
    //sgrid1.Cells[2,sgrid_row]:='and data0060.SALES_ORDER LIKE '''+trim(edit2.Text)+'%''';
    sgrid1.Cells[2,sgrid_row]:='@tnumber';

   end;
 1:begin
      sgrid1.Cells[1,sgrid_row]:=edit2.Text;
      //sgrid1.Cells[2,sgrid_row]:='and data0492.CUT_NO LIKE '''+trim(edit2.Text)+'%''';
      sgrid1.Cells[2,sgrid_row]:='@CUST_PART_NO';
   end;
 2:begin
      sgrid1.Cells[1,sgrid_row]:=edit2.Text;
      //sgrid1.Cells[2,sgrid_row]:='and Data0050.CUSTOMER_PART_NUMBER LIKE '''+trim(edit2.Text)+'%'''
      //                           +' and Data0050.CP_REV LIKE '''+trim(edit1.Text)+'%''';
      sgrid1.Cells[2,sgrid_row]:='@CUSTOMER_PART_NUMBER' ;

   end;
 3:begin
      sgrid1.Cells[1,sgrid_row]:=edit2.Text;
      //sgrid1.Cells[2,sgrid_row]:='and Data0050.CUSTOMER_PART_DESC like '''+trim(edit2.Text)+'%''';
      sgrid1.Cells[2,sgrid_row]:='@CUST_NAME' ;
   end;
 4:begin
      //sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk3.Date)+'到'+datetostr(dtpk4.Date);
      //sgrid1.Cells[2,sgrid_row]:='and Data0060.ENT_DATE >= '''+datetostr(dtpk3.date)+
      //                        ''' and Data0060.ENT_DATE <= '''+datetostr(dtpk4.date+1)+'''';
                              //+' 00:00:00'+                                         +''
      sgrid1.Cells[1,sgrid_row]:=edit2.Text;
      sgrid1.Cells[2,sgrid_row]:='@EMPLOYEE_NAME' ;

   end;
 {5:begin
    sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk3.Date)+'到'+datetostr(dtpk4.Date);
    sgrid1.Cells[2,sgrid_row]:='and data0492.ISSUE_DATE >= '''+datetostr(dtpk3.date)+
                            ''' and data0492.ISSUE_DATE <= '''+datetostr(dtpk4.date+1)+'''';
   end;                    //+' 00:00:00'+                                     +''
 {}                                       
 {5:begin
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;
    sgrid1.Cells[2,sgrid_row]:='and Data0010.CUST_CODE like '''+trim(edit2.Text)+'%''';
   end; {}

 end;

end;

procedure TIf_Form1.BitBtn8Click(Sender: TObject);
begin
  update_sgrid; //新增内容
end;

procedure TIf_Form1.update_sgrid;
var
 i:integer;
begin
 //检查是不是已有加在sgrid1中的内容，没有就增加
 for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
     (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
   begin
     update2_sgrid(i);
     exit;
   end;
 //更新0列记录
 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
 update2_sgrid(sgrid1.RowCount-1);
 //增加一行空的记录
 sgrid1.RowCount :=sgrid1.RowCount +1;
end;

procedure TIf_Form1.ListBox2Click(Sender: TObject);
begin
 label2.Visible:=true;
 label2.Caption:=' '+listbox2.Items[listbox2.itemindex]+':  ';
 label6.Visible:=false;
 label7.Visible:=false;
 dtpk3.Visible:=false;
 dtpk4.Visible:=false;
 edit2.Text:='';
 edit2.Visible:=true;
 bitbtn7.Visible:=false;
 bitbtn8.Enabled:=false;
 edit1.Visible :=false;
 Label1.Visible :=false;

  case listbox2.ItemIndex of
  {2:
      begin
        edit1.Visible :=true;
        Label1.Visible :=true;
        edit2.Visible := true;
        BitBtn7.Visible :=true;
      end;
  {}
  0,1,2,3,4:
      begin
        edit2.Visible := true;
        //BitBtn7.Visible :=true;
      end;
  {4:
      begin
         Label2.Visible := false;
         Label6.Visible :=true;
         Label7.Visible :=true;
         dtpk3.Visible :=true;
         dtpk4.Visible :=true;
         BitBtn8.Enabled :=true;
         edit2.Visible := false;
      end;  {}
  end;
end;

procedure TIf_Form1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if trim(edit2.Text)<>'' then
   bitbtn8.Enabled:=true
  else
   bitbtn8.Enabled:=false;
end;

procedure TIf_Form1.FormShow(Sender: TObject);
begin
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  dtpk3.Date:=EncodeDate(YearOf(now()),MonthOf(now()),1);
  dtpk4.Date:=now();
  DateTimePicker1.Date :=dtpk3.Date;
  DateTimePicker2.Date :=dtpk4.Date;
  //EncodeDate(YearOf(now()),MonthOf(now()),1)
  vparametersvalue1:='';
  vparametersvalue2:='';
  vparametersvalue3:='';
  vparametersvalue4:='';
  vparametersvalue5:='';
  vparametersvalue6:='';
  vparametersvalue7:='';

  SELF.ListBox2.ItemIndex := 0;
  self.ListBox2Click(SELF.ListBox2);
end;

function TIf_Form1.Get_parametersvalue1: string;
begin
  result:=vparametersvalue1;
end;

function TIf_Form1.Get_parametersvalue2: string;
begin
  result:=vparametersvalue2;
end;

function TIf_Form1.Get_parametersvalue3: string;
begin
  result:=vparametersvalue3;
end;

function TIf_Form1.Get_parametersvalue4: string;
begin
  result:=vparametersvalue4;
end;

function TIf_Form1.Get_parametersvalue5: string;
begin
  result:=vparametersvalue5;
end;

function TIf_Form1.Get_parametersvalue6: string;
begin
  result:=vparametersvalue6;
end;

function TIf_Form1.Get_parametersvalue7: string;
begin
  result:=vparametersvalue7;
end;

procedure TIf_Form1.BitBtn7Click(Sender: TObject);
begin
  case listbox2.ItemIndex of
  0:
    begin
      find_SALES_ORDER_Form2:= Tfind_SALES_ORDER_Form2.Create(application) ;
      try
       find_SALES_ORDER_Form2.Caption :='查找销售订单号';
       find_SALES_ORDER_Form2.ADOStoredProc1.Open;
       if find_SALES_ORDER_Form2.ShowModal=mrok then
       begin
         edit2.Text :=find_SALES_ORDER_Form2.ADOStoredProc1sales_order.Value;
         if edit2.Text <>'' then
           BitBtn8.Enabled := true ;
         //showmessage(find_SALES_ORDER_Form2.ADOStoredProc1sales_order.Value  );
       end;
       find_SALES_ORDER_Form2.ADOStoredProc1.Close;
      finally
       find_SALES_ORDER_Form2.Free;
      end;
    end;
  1:
    begin
      find_CUT_NO_Form2:= Tfind_CUT_NO_Form2.Create(application) ;
      try
       find_CUT_NO_Form2.Caption :='查找投料单号';
       find_CUT_NO_Form2.ADOStoredProc1.Open;
       if find_CUT_NO_Form2.ShowModal=mrok then
       begin
         edit2.Text :=find_CUT_NO_Form2.ADOStoredProc1CUT_NO.Value;
         if edit2.Text <>'' then
           BitBtn8.Enabled := true ;
         //showmessage(find_SALES_ORDER_Form2.ADOStoredProc1sales_order.Value  );
       end;
       find_CUT_NO_Form2.ADOStoredProc1.Close;
      finally
       find_CUT_NO_Form2.Free;
      end;
    end;
  2:
    begin
      find_CUSTOMER_PART_NUMBER_Form2:= Tfind_CUSTOMER_PART_NUMBER_Form2.Create(application) ;
      try
       find_CUSTOMER_PART_NUMBER_Form2.Caption :='查找本厂编号';
       find_CUSTOMER_PART_NUMBER_Form2.ADOStoredProc1.Open;
       if find_CUSTOMER_PART_NUMBER_Form2.ShowModal=mrok then
       begin
         edit2.Text :=find_CUSTOMER_PART_NUMBER_Form2.ADOStoredProc1CUSTOMER_PART_NUMBER.Value;
         edit1.Text :=find_CUSTOMER_PART_NUMBER_Form2.ADOStoredProc1CP_REV.Value;
         if edit2.Text <>'' then
           BitBtn8.Enabled := true ;
         //showmessage(find_SALES_ORDER_Form2.ADOStoredProc1sales_order.Value  );
       end;
       find_CUSTOMER_PART_NUMBER_Form2.ADOStoredProc1.Close;
      finally
       find_CUSTOMER_PART_NUMBER_Form2.Free;
      end;
    end;
  3:
    begin
      find_CUSTOMER_PART_DESC_Form2:= Tfind_CUSTOMER_PART_DESC_Form2.Create(application) ;
      try
       find_CUSTOMER_PART_DESC_Form2.Caption :='查找客户型号';
       find_CUSTOMER_PART_DESC_Form2.ADOStoredProc1.Open;
       if find_CUSTOMER_PART_DESC_Form2.ShowModal=mrok then
       begin
         edit2.Text :=find_CUSTOMER_PART_DESC_Form2.ADOStoredProc1CUSTOMER_PART_DESC.Value;
         if edit2.Text <>'' then
           BitBtn8.Enabled := true ;
         //showmessage(find_SALES_ORDER_Form2.ADOStoredProc1sales_order.Value  );
       end;
       find_CUSTOMER_PART_DESC_Form2.ADOStoredProc1.Close;
      finally
       find_CUSTOMER_PART_DESC_Form2.Free;
      end;
    end;
  5:
    begin
      find_CUST_CODE_Form2:= Tfind_CUST_CODE_Form2.Create(application) ;
      try
       find_CUST_CODE_Form2.Caption :='查找客户代码';
       find_CUST_CODE_Form2.ADOStoredProc1.Open;
       if find_CUST_CODE_Form2.ShowModal=mrok then
       begin
         edit2.Text :=find_CUST_CODE_Form2.ADOStoredProc1CUST_CODE.Value;
         if edit2.Text <>'' then
           BitBtn8.Enabled := true ;
         //showmessage(find_SALES_ORDER_Form2.ADOStoredProc1sales_order.Value  );
       end;
       find_CUST_CODE_Form2.ADOStoredProc1.Close;
      finally
       find_CUST_CODE_Form2.Free;
      end;
    end;

   end;
  
end;

procedure TIf_Form1.FormCreate(Sender: TObject);
begin
  self.BorderIcons := self.BorderIcons - [biMinimize] - [biMaximize];
  self.BorderStyle  := bsSingle;
  self.Position := poScreenCenter;
end;

end.
