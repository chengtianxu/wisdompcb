unit Frm_dec_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, Mask, StdCtrls, DBCtrls, DBCtrlsEh, Buttons,DB,DateUtils ,
  ExtCtrls, ToolWin, ImgList, Spin;

type
  TcdsState = (ad,ed,de,bo,Au);
  TFrm_dec = class(TForm)
    BtImageList: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtAstNo: TEdit;
    ComBoxFasAlt: TComboBox;
    BitBtn5: TBitBtn;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EdtVoucher: TMaskEdit;
    DtActnote: TDateTimePicker;
    Edit7: TEdit;
    EdtStatus: TEdit;
    ScrollBox1: TScrollBox;
    sgrid1: TStringGrid;
    BtActNote: TButton;
    Panel3: TPanel;
    Label29: TLabel;
    Label12: TLabel;
    Edit15: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Edit4: TEdit;
    status2: TPanel;
    ToolBar1: TToolBar;
    BtAdd: TToolButton;
    BtEdit: TToolButton;
    BtDel: TToolButton;
    ToolButton2: TToolButton;
    BtSave: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    BtClose: TToolButton;
    Label17: TLabel;
    Edit6: TEdit;
    Label18: TLabel;
    Edit8: TEdit;
    Label19: TLabel;
    Edit9: TEdit;
    Label20: TLabel;
    Edit10: TEdit;
    Label21: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Label22: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label23: TLabel;
    Edit5: TEdit;
    procedure sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BtActNoteClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtAddClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure sgrid1Exit(Sender: TObject);
  private
    cdsState: TcdsState;
    Aact:array of integer;
    Aacount:array[1..20] of integer; 
    Fisok:boolean;
    FaltTp: integer;

    Ffasset_ptr,Fvoucher_ptr:string;
    NoVoucher:boolean;

    procedure BtnRts;
    function saveValid:boolean;
    procedure init(altTp:integer;dt: TDataset);
    procedure recalculation;
    procedure saveVal;
    function get_vouchernumber(inv_date: tdatetime): string;
    procedure getFixAttr(sRkey:string);
  public
    class procedure dec_op(altTp:integer;dt:TDataset=nil); //altTp=0 for add;altTp=1 for edit;alttp=2 for browse
    { Public declarations }
  end;

var
  Frm_dec: TFrm_dec;

implementation
 uses DM_u,AcctSearch,Dictionary,Frm_find_u,common;
{$R *.dfm}

procedure TFrm_dec.sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if cdsstate=bo then exit;
  BtActNote.Visible:=false;
  if (Acol<2) and (ARow>0) then
  begin
    if ACol=0 then
      BtActNote.Left:=sgrid1.ColWidths[0]-BtActNote.Width+1
    else
      BtActNote.Left:=sgrid1.ColWidths[0]+sgrid1.ColWidths[1]-BtActNote.Width+2;
    BtActNote.Top:=ARow*(sgrid1.RowHeights[0]+1);
    BtActNote.Visible:=true;
  end;
  if  (ARow=0) or ((ACol>0) and (Acol<5)) then
    sgrid1.Options:=sgrid1.Options-[goEditing]
  else
    sgrid1.Options:=sgrid1.Options+[goEditing];
  recalculation;
end;

procedure TFrm_dec.sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if sgrid1.Col>2 then
  if not (key in ['0'..'9','.','-',#13,#8]) then abort  else
  begin
    if (key = chr(46)) then
      if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0 then abort;
    if sgrid1.col=5 then  sgrid1.Cells[6,sgrid1.Row]:='';
    if sgrid1.col=6 then  sgrid1.Cells[5,sgrid1.Row]:='';
  end;
end;

procedure TFrm_dec.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
 If arow=0 then
  begin
    sgrid1.Canvas.Brush.Color:=clBtnFace;
   If acol<=3 then
    sgrid1.Canvas.TextRect(rect,rect.Left+(rect.right-sgrid1.Canvas.TextWidth(sgrid1.Cells[acol,arow])-rect.Left) div 2,
        rect.Top+2, sgrid1.Cells[aCol,aRow])
   else
    sgrid1.Canvas.TextRect(rect,rect.right-sgrid1.Canvas.TextWidth(sgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, sgrid1.Cells[aCol,aRow]);
    exit;
  end;

  If acol>3 then
  if trim(sgrid1.Cells[aCol,aRow])<>'' then
   sgrid1.Canvas.TextRect(rect,rect.right-sgrid1.Canvas.TextWidth(format('%.2f',[strtofloat(sgrid1.Cells[aCol,aRow])]))-2,
     rect.Top+2, format('%.2f',[strtofloat(sgrid1.Cells[aCol,aRow])])	);
end;

procedure TFrm_dec.BtActNoteClick(Sender: TObject);
var sV1,sV2:string;
begin
  if sgrid1.Col=0 then
  with TFrmDictionary.Create(nil) do
  begin
    if ShowModal=mrok then
      self.sgrid1.Cells[0,sgrid1.Row]:=trim(adodata0513.Fieldbyname('description').asstring);
    free;
  end
  else
  try
   form_acct:=tform_acct.Create(application);
   if form_acct.ShowModal=mrok then
   begin
      sgrid1.Cells[1,sgrid1.Row]:=trim(DM.Data0103GL_ACC_NUMBER.Value)+'-'+
                                  trim(DM.Data0103DESCRIPTION_2.Value);
      if DM.Data0103CURR_PTR.IsNull then
      begin
        sgrid1.Cells[2,sgrid1.Row]:=sCuur_code;
        sgrid1.Cells[3,sgrid1.Row]:='1';
      end else begin
        DM.getCuur(DM.Data0103CURR_PTR.AsString,0,sV1,sV2);
        sgrid1.Cells[2,sgrid1.Row]:=sV1;
        sgrid1.Cells[3,sgrid1.Row]:=sV2;
      end;
   end;
  finally
   form_acct.Free;
end;

end;

procedure TFrm_dec.BitBtn5Click(Sender: TObject);
var fVlue:TfldValue;
    ok:boolean;
begin
  with DM.ADO517 do
  begin
    open;
    fVlue:=TFrm_find.getStr(DM.ADO517,'固定资产档',ok);
    if ok then
    begin
      Ffasset_ptr:=GetFldV(fVlue,'rkey');
      getFixAttr(Ffasset_ptr);
      EdtAstNo.Text:=GetFldV(fVlue,'FASSET_CODE') ;
    end;
    close;
  end;

end;

procedure TFrm_dec.BtnRts;
begin
  BtAdd.Enabled:=((FaltTp=0) and (PageControl1.ActivePageIndex=0) and (cdsState=bo)) or ((PageControl1.ActivePageIndex=1) and (cdsState<>bo)) ;
  BtEdit.Enabled:=(FaltTp<2) and (PageControl1.ActivePageIndex=1) and (cdsState<>bo);
  BtDel.Enabled:=BtEdit.Enabled;

  BtSave.Enabled:=(FaltTp<2) and (cdsState<>bo);
  BitBtn5.Enabled:=(FaltTp=0) and (cdsState=ad);
  ComBoxFasAlt.Enabled:=(FaltTp<2) and  (cdsState<>bo);
  if (FaltTp<2) and (PageControl1.ActivePageIndex=1) then
  begin
    if cdsState<>bo then sgrid1.Options:=sgrid1.Options+[goEditing] else sgrid1.Options:=sgrid1.Options-[goEditing];
    if cdsState=bo then BtActNote.Visible:=false;
  end;
end;

function TFrm_dec.saveValid: boolean;
var i:integer;
begin
  result:=false;

  if EdtAstNo.Text='' then
  begin
    showmessage('固定资产编号不能为空!');
    abort;
  end;
  if ComBoxFasAlt.ItemIndex=-1 then
  begin
    showmessage('固定资产减少方式不能为空!');
    abort;
  end;

  recalculation;
  if  (strtocurr(edit3.text)=0) and (strtocurr(edit2.Text)=0) then
  begin
    result:=true;
    NoVoucher:=true;  //不做凭证
    exit;
  end else
    NoVoucher:=false;

 if strtocurr(edit3.text)<>strtocurr(edit2.Text) then
  begin
   messagedlg('借方金额同贷方金额不相等！',mtinformation,[mbok],0);
   exit;
  end;

  if strtocurr(edit2.Text)<>strtocurr(edit9.Text) then
  begin
   messagedlg('贷方金额同固定资产原值不相等！',mtinformation,[mbok],0);
   exit;
  end;

 if sgrid1.Rowcount<2 then
  begin
   messagedlg('凭证未做完整！',mtinformation,[mbok],0);
   exit;
  end;

  for i:=0 to sgrid1.Rowcount-2 do
   if (trim(sgrid1.Cells[5,i])='') and (trim(sgrid1.Cells[6,i])='') then
    begin
     messagedlg('凭证不能有空记录！',mtinformation,[mbok],0);
     exit;
    end;

  for i:=1 to sgrid1.RowCount-2 do
   if sgrid1.Cells[1,i]='' then
    begin
     messagedlg('请输入会计科目！',mtinformation,[mbok],0);
     exit;
    end;

   if  FM ='' then
   begin
     messagedlg('会计期间没有初始化！',mtinformation,[mbok],0);
     exit;
   end else begin
     if (strtoint(FY)>SpinEdit1.Value) or ((strtoint(FY)>= SpinEdit1.Value) and (strtoint(FM)>SpinEdit2.Value)) then
     begin
       messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
       exit;
     end;
   end;
   if SpinEdit2.Value<> monthof(DtActnote.date) then
   begin
     messagedlg('凭证期间不等于凭证日期的会计期间,请修改!',mterror,[mbcancel],0);
     DtActnote.setfocus;
     exit;
   end;
  result:=true;
end;

procedure TFrm_dec.BtAddClick(Sender: TObject);
var i,j:integer;
begin
  if PageControl1.ActivePageIndex=1 then
  begin
    case TToolButton(sender).Tag of
      0:begin
          sgrid1.RowCount:=sgrid1.RowCount+1;
          i:=sgrid1.RowCount-1;
          sgrid1.Cells[0,i]:=sgrid1.Cells[0,i-1];
          for j:=1 to 6 do sgrid1.Cells[j,i]:='';
          cdsState:=ad;
        end;
      1:cdsState:=ed;
      2:begin
          if sgrid1.Row<>0 then
          begin
            if messagebox(Handle,'是否确定删除当前分录？','提示',mb_yesno+mb_iconquestion)=id_no then exit;
            for i:=sgrid1.Row to sgrid1.RowCount-2 do
              for j:=0 to 6 do sgrid1.Cells[j,i]:=sgrid1.Cells[j,i+1];
            sgrid1.RowCount:=sgrid1.RowCount-1;
          end;
        end ;
      end
  end else
  case TToolButton(sender).Tag of
  0: begin
      cdsState:=ad;
      EdtAstNo.Text:='';
      DateTimePicker1.Date:=strtodate(FY+'-'+FM+'-'+'28');
      DtActnote.Date:=DateTimePicker1.Date;
      Edit4.text:=FLoginName;
      Edit15.Text:=FLoginName;
      ComBoxFasAlt.ItemIndex:=-1;
      getFixAttr('-1');
     end;
  1: begin cdsState:=ed;end;
  end;


  if TToolButton(sender).Tag=4 then
  begin
    if not saveValid then abort;
    saveVal;
    cdsState:=bo;
    Fisok:=true;
  end else if TToolButton(sender).Tag=13 then begin  close; exit; end;
  BtnRts;
end;

procedure TFrm_dec.init(altTp:integer;Dt:Tdataset);
var S:string;
    i:integer;
begin
  sgrid1.cells[0,0]:='摘    要';
  sgrid1.cells[1,0]:='科目代号/名称';
  sgrid1.cells[2,0]:='币种';
  sgrid1.cells[3,0]:='汇率';
  sgrid1.cells[4,0]:='原币金额';
  sgrid1.cells[5,0]:='借方(本币)金额';
  sgrid1.cells[6,0]:='贷方(本币)金额';

  status2.Caption:='当前会计期间：'+FY+'年'+FM+'月';
  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='select * from data0515 where alt_flag=1';
  DM.Tmp1.Open;
  setlength(Aact,DM.Tmp1.RecordCount);
  while not DM.Tmp1.Eof do
  begin
    Aact[DM.Tmp1.RecNo-1]:=DM.Tmp1.fieldbyname('Rkey').AsInteger;
    ComBoxFasAlt.Items.Append(DM.Tmp1.fieldbyname('fasset_alt_type').AsString);
    DM.Tmp1.Next;
  end;


  if altTp=0 then //add
  begin
    DateTimePicker1.Date:=strtodate(FY+'-'+FM+'-25');
    DtActnote.Date:=DateTimePicker1.Date;
    SpinEdit1.Value:=strtoint(FY);
    SpinEdit2.Value:=strtoint(FM);
    Edit4.Text:=FLoginName;
    BtAddClick(Btadd);
  end else begin   //adit or bro
    Edit4.Text:=Dt.fieldbyname('employee_name').AsString;
    Ffasset_ptr:=Dt.fieldbyname('rkey').AsString;
    getFixAttr(Ffasset_ptr);
    EdtAstNo.Text:=Dt.fieldbyname('FASSET_CODE').AsString;
    DateTimePicker1.Date:=Dt.fieldbyname('dimi_date').AsDateTime;
    for i:=low(Aact) to high(Aact) do
    if Aact[i]=Dt.fieldbyname('act_ptr').AsInteger then
    begin
      ComBoxFasAlt.ItemIndex:=i;
      break;
    end;
    Edit1.Text:=Dt.fieldbyname('reson').AsString;

   //凭证
   if Dt.fieldbyname('voucher_ptr').AsString<>'' then
   with DM.Tmp1 do
   begin
     Fvoucher_ptr:=Dt.fieldbyname('voucher_ptr').AsString;
     Close;
     SQL.Text:='SELECT dbo.Data0105.VOUCHER, dbo.Data0105.FYEAR, dbo.Data0105.PERIOD,'+
                        'dbo.Data0105.ATTACHED, dbo.Data0105.ENTERED_DT,data0105.Batch_number,'+
                        'dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTION,'+
                        'dbo.Data0106.D_C,'+
                        'case when Data0106.EXCH_RATE>0 then '+
                        'ROUND(1/dbo.Data0106.EXCH_RATE, 4) else 0 end AS exch_rate,'+
                        'dbo.Data0001.CURR_CODE, dbo.Data0106.AMOUNT,'+
                        'ROUND(dbo.Data0106.AMOUNT * dbo.Data0106.EXCH_RATE, 2) AS orig_amount,'+
                        'dbo.Data0005.EMPLOYEE_NAME,dbo.Data0106.DESCRIPTION,data0105.status '+
                  'FROM dbo.Data0105 INNER JOIN '+
                        'dbo.Data0106 ON '+
                        'dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN '+
                        'dbo.Data0103 ON '+
                        'dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY INNER JOIN '+
                        'dbo.Data0001 ON dbo.Data0106.CURR_PTR = dbo.Data0001.RKEY INNER JOIN '+
                        'dbo.Data0005 ON dbo.Data0105.ENTERED_BY_EMPL_PTR = dbo.Data0005.RKEY '+
                  'WHERE Data0105.rkey ='+Fvoucher_ptr;
     Open;

     case DM.Tmp1.FieldByName('status').AsInteger of
      0: s:='未审核';
      1: s:='会计已审';
      2: s:='主管已审';
      3: s:='已登帐';
      4: s:='出纳已审';
      5: s:='作废';
     end;
     EdtStatus.Text:= s;
     EdtVoucher.Text:=FieldByName('Voucher').AsString;
     DtActnote.Date:=FieldByName('Entered_dt').AsDateTime;
     Edit7.Text:=FieldByName('Batch_number').AsString;
     SpinEdit3.Value:=FieldByName('Attached').AsInteger;
     SpinEdit1.Value:=FieldByName('Fyear').AsInteger;
     SpinEdit2.Value:=FieldByName('Period').AsInteger;
     edit15.Text:=fieldbyname('EMPLOYEE_NAME').asstring;
     while not eof do
     begin
       sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid1.Cells[0,sgrid1.RowCount-1]:=Fieldbyname('description').asstring; //摘要
       sgrid1.Cells[1,sgrid1.RowCount-1]:=trim(Fieldbyname('gl_acc_number').asstring)+'-'+
                                          Fieldbyname('GL_DESCRIPTION').asstring;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=Fieldbyname('CURR_CODE').asstring;
      sgrid1.Cells[3,sgrid1.RowCount-1]:=Fieldbyname('EXCH_RATE').AsString;
      sgrid1.Cells[4,sgrid1.RowCount-1]:= Fieldbyname('orig_amount').AsString;
      if UpperCase(Fieldbyname('d_c').asstring)='D' then
         sgrid1.Cells[5,sgrid1.RowCount-1]:=Fieldbyname('AMOUNT').asstring
      else
        sgrid1.Cells[6,sgrid1.RowCount-1]:=Fieldbyname('AMOUNT').asstring;
      next;
     end;
   end;
   recalculation;
   if altTp=1 then BtAddClick(BtEdit) else BtnRts;
  end ;

end;

procedure TFrm_dec.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {  CanClose:=not Fisok and
             (messagebox(handle,pchar('当前还有未保存的数据，保存否？'),pchar('提示'),
             MB_YESNO or MB_ICONINFORMATION+MB_DEFBUTTON2)=IDNO);  }
end;

class procedure TFrm_dec.dec_op(altTp: integer;dt: TDataset=nil);
begin
  with TFrm_dec.Create(nil) do
  try
    cdsstate:=bo;
    FaltTp:=altTp;
    init(altTp,Dt);
    ShowModal;
  finally
    if Fisok then begin Dt.Close;Dt.Open;end;
    free;
  end;
end;

procedure TFrm_dec.PageControl1Change(Sender: TObject);
begin
  BtnRts;
end;

procedure TFrm_dec.recalculation;
var i:integer;
    vdb,vcr:real;
begin
  vdb:=0;
  vcr:=0;
  for i:=1 to sgrid1.rowcount-1 do
  begin
    if trim(sgrid1.Cells[5,i])<>'' then
    begin
      vdb:=vdb+strtofloat(sgrid1.Cells[5,i]);
      if sgrid1.Cells[3,i]<>'' then
       sgrid1.Cells[4,i]:=formatfloat('0.00',strtofloat(sgrid1.Cells[5,i])/strtofloat(sgrid1.Cells[3,i]));
    end;
    if trim(sgrid1.Cells[6,i])<>'' then
    begin
      vcr:=vcr+strtofloat(sgrid1.Cells[6,i]);
      if sgrid1.Cells[3,i]<>'' then
       sgrid1.Cells[4,i]:=formatfloat('0.00',strtofloat(sgrid1.Cells[6,i])/strtofloat(sgrid1.Cells[3,i]));
    end;
  end;
  edit2.Text :=format('%.2f',[vdb]);
  edit3.Text :=format('%.2f',[vcr]);
end;

procedure TFrm_dec.sgrid1Exit(Sender: TObject);
begin
 recalculation;
end;

procedure TFrm_dec.saveVal;
var sRkey,sAlt_tp,s:string;
    msql:string;
    i:integer;
    sV1,sV2:string ;
    function getAcountRkey(s:string):string;
    var j:integer;
    begin
       j:=pos('-',s);
       DM.Tmp1.Close;
       DM.Tmp1.SQL.Text:='select rkey from data0103 where gl_acc_number='''+copy(s,1,j-1)+'''';
       DM.Tmp1.Open;
       if not DM.Tmp1.IsEmpty then  result:=DM.Tmp1.Fields[0].AsString else result:='';
       DM.Tmp1.Close;
    end;
begin
  if not saveValid then exit;
  try
    sRkey:='null';
    DM.ADOCon.BeginTrans;
    if FaltTp=0 then //add
    begin
      if not NoVoucher then
      begin
        EdtVoucher.Text:=get_vouchernumber(DtActnote.Date);
        DM.Tmp1.Close ;
        dm.Tmp1.sql.text:='select * from data0105 where rkey is null';
        dm.Tmp1.Open;
        dm.Tmp1.Append;
        dm.Tmp1.FieldValues['voucher']:=EdtVoucher.Text;
        dm.Tmp1.FieldValues['attached']:=SpinEdit3.Value;
        dm.Tmp1.FieldValues['BATCH_NUMBER']:=edit7.Text;
        dm.Tmp1.FieldValues['trans_type']:=9;
        dm.Tmp1.FieldValues['entered_by_empl_ptr']:=strtoint(user_ptr);
        dm.Tmp1.FieldValues['entered_dt']:=DtActnote.Date;
        dm.Tmp1.FieldValues['FYEAR']:=SpinEdit1.Value;
        dm.Tmp1.FieldValues['period']:=SpinEdit2.Value;
        dm.Tmp1.FieldValues['vou_type']:=4;
        dm.Tmp1.Post;
        sRkey:=dm.Tmp1.fieldbyname('rkey').asstring;
        dm.Tmp1.Close;
        for i:=1 to sgrid1.RowCount-1 do
        begin
          msql :='insert data0106(GL_HEADER_PTR,GL_ACCT_NO_PTR,DESCRIPTION,AMOUNT,D_C,CURR_PTR,EXCH_RATE) ';
          msql :=msql+'values(';
          msql :=msql+sRkey+',';    //凭证号指针
          s:=getAcountRkey(sgrid1.Cells[1,i]);
          if s='' then begin showmessage(sgrid1.Cells[1,i]+'不存在'); abort;end;
          msql :=msql+s+',';                               //科目指针
          msql :=msql+''''+sgrid1.Cells[0,i]+''''+',';      //摘要
          if trim(sgrid1.Cells[5,i])<>'' then
          begin
             msql :=msql+sgrid1.Cells[5,i]+',';             //本位币
             msql :=msql+''''+'D'+''''+',';                 //方向
          end  else begin
            msql :=msql+sgrid1.Cells[6,i]+',';
            msql :=msql+''''+'C'+''''+',';
          end;
          DM.getCuur(sgrid1.cells[2,i],1,sV1,sV2);
          msql :=msql+sV1+',';                               //币指针
          msql :=msql+sV2+')';                               //汇率
          dm.Tmp1.SQL.Text:=msql;
          dm.Tmp1.ExecSQL;
        end;
      end;

      sAlt_tp:=inttostr(Aact[ComBoxFasAlt.ItemIndex]) ;
      DM.Tmp1.Close;
      DM.Tmp1.SQL.Text:='insert into data0525(fasset_ptr,act_ptr,dimi_date,reson,voucher_ptr,ent_by_ptr) '+
                        'values ('+Ffasset_ptr+','+sAlt_tp+','''+datetostr(DateTimePicker1.Date)+''','''+Edit1.Text+''','+sRkey+','+user_ptr+')';
      DM.Tmp1.ExecSQL;

      DM.Tmp1.SQL.Text:='update data0517 set active_flag=0 where rkey='+Ffasset_ptr;
      DM.Tmp1.ExecSQL;
      DM.Tmp1.SQL.Text:='update data0528 set summed_depre=0 where d0517_ptr='+Ffasset_ptr+' and Fyear='+FY+' and period='+FM;
      DM.Tmp1.ExecSQL;

    end else begin  //edit
      if not NoVoucher then
      begin
        DM.Tmp1.Close ;
        dm.Tmp1.sql.text:='select * from data0105 where rkey='+Fvoucher_ptr;
        dm.Tmp1.Open;
        dm.Tmp1.edit;
        dm.Tmp1.FieldValues['attached']:=SpinEdit3.Value;
        dm.Tmp1.FieldValues['entered_by_empl_ptr']:=strtoint(user_ptr);
        dm.Tmp1.FieldValues['entered_dt']:=DtActnote.Date;
        dm.Tmp1.FieldValues['FYEAR']:=SpinEdit1.Value;
        dm.Tmp1.FieldValues['period']:=SpinEdit2.Value;
        dm.Tmp1.FieldValues['BATCH_NUMBER']:=edit7.Text;
        dm.Tmp1.Post;

        DM.Tmp1.Close;
        DM.Tmp1.SQL.Text:='delete from data0106 where GL_HEADER_PTR='+Fvoucher_ptr;
        DM.Tmp1.ExecSQL;

        for i:=1 to sgrid1.RowCount-1 do
        begin
          msql :='insert data0106(GL_HEADER_PTR,GL_ACCT_NO_PTR,DESCRIPTION,AMOUNT,D_C,CURR_PTR,EXCH_RATE) ';
          msql :=msql+'values(';
          msql :=msql+Fvoucher_ptr+',';    //凭证号指针
          s:=getAcountRkey(sgrid1.Cells[1,i]);
          if s='' then begin showmessage(sgrid1.Cells[1,i]+'不存在'); abort;end;
          msql :=msql+s+',';
          msql :=msql+''''+sgrid1.Cells[0,i]+''''+',';
          if trim(sgrid1.Cells[5,i])<>'' then
          begin
             msql :=msql+sgrid1.Cells[5,i]+',';
             msql :=msql+''''+'D'+''''+',';
          end  else begin
            msql :=msql+sgrid1.Cells[6,i]+',';
            msql :=msql+''''+'C'+''''+',';
          end;
          DM.getCuur(sgrid1.cells[2,i],1,sV1,sV2);
          msql :=msql+sV1+',';
          msql :=msql+sV2+')';
          dm.Tmp1.SQL.Text:=msql;
          dm.Tmp1.ExecSQL;
        end;
      end;

      sAlt_tp:=inttostr(Aact[ComBoxFasAlt.ItemIndex]) ;
      DM.Tmp1.Close;
      DM.Tmp1.SQL.Text:='update data0525 set act_ptr='+sAlt_tp+',dimi_date='''+datetostr(DateTimePicker1.Date)+
                        ''',reson='''+Edit1.Text+''' where fasset_ptr='+Ffasset_ptr;
      DM.Tmp1.ExecSQL;
      DM.Tmp1.SQL.Text:='update data0528 set summed_depre=0 where d0517_ptr='+Ffasset_ptr+' and Fyear='+FY+' and period='+FM;
      DM.Tmp1.ExecSQL;
    end;
    DM.ADOCon.CommitTrans;
  except
    DM.ADOCon.RollbackTrans;
    showmessage('保存失败,请您再保存一次...');
    abort;
  end;
end;

function TFrm_dec.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
 voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
 if length(inttostr(monthof(inv_date))) < 2 then
   voucher := voucher+'0'+inttostr(monthof(inv_date))
 else
   voucher := voucher+inttostr(monthof(inv_date));      //月份
 with dm.Tmp1 do
 begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
 end;
 if dm.Tmp1.IsEmpty then
 begin
   voucher:= voucher+'00001';
 end
 else
 begin
    pr_req := strtoint(copy(dm.Tmp1.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
 end;
 result:=voucher;
end;

procedure TFrm_dec.getFixAttr(sRkey: string);
begin
  DM.Tmp1.Close;
  DM.Tmp1.SQL.Text:='select * from data0517 where rkey='+sRkey;
  DM.Tmp1.Open;
  if not DM.Tmp1.IsEmpty then
  begin
    Edit5.Text:=DM.Tmp1.fieldbyname('id_code').AsString;
    Edit6.Text:=DM.Tmp1.fieldbyname('location').AsString;
    Edit8.Text:=DM.Tmp1.fieldbyname('book_date').AsString;
    Edit9.Text:=DM.Tmp1.fieldbyname('original_value').AsString;
    Edit10.Text:=DM.Tmp1.fieldbyname('summed_depre').AsString;
    Edit11.Text:=DM.Tmp1.fieldbyname('fasset_desc').AsString;
    Edit12.Text:=floattostr(DM.Tmp1.fieldbyname('original_value').AsFloat-DM.Tmp1.fieldbyname('summed_depre').AsFloat);
  end else begin
    Edit6.Text:='';
    Edit8.Text:='';
    Edit9.Text:='';
    Edit10.Text:='';
    Edit11.Text:='';
    Edit12.Text:='';
    Edit5.Text:='';
    sgrid1.RowCount:=1;
  end;
end;

end.
