unit Query_BOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TQuery_term = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DTPk1: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    DTPk2: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    ed_CUT_NO: TEdit;
    SB_CUT_NO: TSpeedButton;
    Label5: TLabel;
    ed_part_name: TEdit;
    SB_part_name: TSpeedButton;
    btn_Look: TBitBtn;
    btn_Start: TBitBtn;
    btn_Esc: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;

    procedure btn_EscClick(Sender: TObject);
    procedure SB_CUT_NOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_LookClick(Sender: TObject);
    procedure ed_CUT_NODblClick(Sender: TObject);
    procedure SB_part_nameClick(Sender: TObject);
    procedure ed_part_nameDblClick(Sender: TObject);
    procedure btn_StartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    D_TPK1date,D_TPK2date,D_DTPK1,D_DTPK2 : TDateTime;
  public
    { Public declarations }
  end;

var
  Query_term: TQuery_term;

implementation

uses Pick_Item_Single,ConstVar,DB, Query_DM,
   QueryPick_CutnoShop, QueryPick_BOMShop, QueryPick_DemandShop,common;

{$R *.dfm}

// 创建窗体
procedure TQuery_term.FormCreate(Sender: TObject);
begin
    if not App_init_2(DM.ADOConn1) then
      begin
         showmsg('程序起动失败请联系管理员!',1);
         Application.Terminate;
      end; 

   Self.Caption := Application.Title;
   DTPk2.DateTime := Now;
    DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

 //关闭
procedure TQuery_term.btn_EscClick(Sender: TObject);
begin
    Close;   //关闭程序运行
end;                                                            

//生产单号
procedure TQuery_term.SB_CUT_NOClick(Sender: TObject);
begin
     D_TPK1date := DTPk1.DateTime;
     D_TPK2date := DTPk2.DateTime;
     D_DTPK1 := DateTimePicker1.DateTime;
     D_DTPK2 := DateTimePicker2.DateTime;

     with  TQueryPick_Cutno.Create(Application) do
      try
         ADS_pickitem.Close;
         if ed_CUT_NO.Text <> '' then
         
           ADS_pickitem.CommandText := ADS_pickitem.CommandText + ' and data0492.rkey not in  '+ Label6.Caption;
           ADS_pickitem.CommandText := ADS_pickitem.CommandText+
           ' and ISSUE_DATE >= '+QuotedStr(DateTimeToStr(D_TPK1date +D_DTPK1 ))+'and  ISSUE_DATE <='+QuotedStr(DateTimeToStr(D_TPK2date+D_DTPK2))+ ' order by cust_code ';
         ADS_pickitem.Open;

         if ShowModal = mrok then
          begin
             CDS_pickitem.First;
             Label6.Caption := Copy(Label6.Caption,1,Length(Label6.Caption)-1);
             if Length(Label6.Caption) > 1 then
               Label6.Caption := Label6.Caption + ','; // Label6.Caption := '';
             while not CDS_pickitem.Eof do
               begin
                 if CDS_pickitem.FieldByName('isselected').AsBoolean then
                  begin
                    ed_CUT_NO.Text := ed_CUT_NO.Text + CDS_pickitem.fieldbyName('CUT_NO').AsString + ';';

                    //if CDS_pickitem.RecNo <> CDS_pickitem.RecordCount then
                      Label6.Caption := Label6.Caption + CDS_pickitem.fieldbyName('rkey').AsString + ','
//                    else
//                      Label6.Caption := Label6.Caption + CDS_pickitem.fieldbyName('rkey').AsString + ')';
                  end;
                  CDS_pickitem.Next; //  '('+
               end;
            Label6.Caption :=  Copy(Label6.Caption,0,Length(Label6.Caption)-1)+')';
          end;
      finally
        Release;
      end;
end;

//查询
procedure TQuery_term.btn_LookClick(Sender: TObject);
begin

    if (Length(Trim(ed_CUT_NO.Text)) < 1)  then
      begin
        ShowMessage('请选择生产单号!');
      end
    else
      begin
         try
            QueryPick_Demand := TQueryPick_Demand.Create(Application);
          finally
             QueryPick_Demand.ShowModal;
             QueryPick_Demand.Free;
          end;
      end;

end;

procedure TQuery_term.ed_CUT_NODblClick(Sender: TObject);
begin
    ed_CUT_NO.Text := '';
    Label6.Caption := '(,';
end;
 //BOM
procedure TQuery_term.SB_part_nameClick(Sender: TObject);
begin
    if  ed_CUT_NO.Text <> '' then
      begin
        with TQueryPick_BOM.Create(Application) do
          try
              ADS_pickitem.Close;

                 if ed_part_name.Text <> '' then
                 // QueryPick_BOM := TQueryPick_BOM.Create(Application);
                 // QueryPick_BOM.ShowModal;
                  ADS_pickitem.CommandText := ADS_pickitem.CommandText + ' and WZCP0494.rkey not in ' + Label7.Caption;
                 // ADS_pickitem.CommandText := ADS_pickitem.CommandText + ' and exists (select BOM_PTR from data0492 where data0492.BOM_PTR=data0008.rkey and data0492.rkey in '+ Label6.Caption + ')' ;
                 ADS_pickitem.CommandText := ADS_pickitem.CommandText + ' and WZCP0494.part_ptr in (select data0008.rkey from data0008 left join dbo.data0492 ON dbo.Data0008.RKEY = dbo.data0492.BOM_PTR where data0492.rkey in '+ Label6.Caption + ')' ;
                  ADS_pickitem.CommandText := ADS_pickitem.CommandText + ' order by PROD_CODE ' ;
                  ADS_pickitem.Open;

                  if ShowModal = mrok then
                   begin
                      CDS_pickitem.First;
                      Label7.Caption := Copy(Label7.Caption,1,Length(Label7.Caption)-1);
                      if Length(Label7.Caption) >1 then
                        Label7.Caption := Label7.Caption + ',';  // Label7.Caption := '';

                      while not CDS_pickitem.Eof do
                       begin
                          if CDS_pickitem.FieldByName('isselected').AsBoolean then
                            begin
                              ed_part_name.Text := ed_part_name.Text + CDS_pickitem.fieldbyName('PROD_CODE').AsString + ';';
                              Label7.Caption := Label7.Caption + CDS_pickitem.fieldbyName('rkey').AsString + ','
                            end;
                            CDS_pickitem.Next; // '('+
                       end;
                      Label7.Caption :=  Copy(Label7.Caption,0,Length(Label7.Caption)-1)+')';
                   end;
          finally
            Release;
          end;
      end
    else
     begin
       ShowMessage('请先选择生产单号!');
     end;
end;

procedure TQuery_term.ed_part_nameDblClick(Sender: TObject);
begin
      ed_part_name.Text := '';
      Label7.Caption := '(,';
end;
 //重置
procedure TQuery_term.btn_StartClick(Sender: TObject);
begin
   if (Length(Trim(ed_CUT_NO.Text))>1) or (Length(Trim(ed_part_name.Text)) >1)  then
     begin
        ed_CUT_NO.Clear;
        Label6.Caption :='(,';
        ed_part_name.Clear;
        Label7.Caption := '(,';
     end;
        
end;

procedure TQuery_term.FormShow(Sender: TObject);
begin
    DTPk2.Date := Date();
    DTPk1.Date := Date()-15;

end;


end.
