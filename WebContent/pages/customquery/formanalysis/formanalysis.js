//�г� 146�� ְ���δ����������Ķ�Ӧ ����ְ���δ��� ��ȡ���� ��ϯ�󷨹ټ����¶��Ǵ��
var map={	
	//'01':'',//����Ա
	'1A01':'6',//���Ҽ���ְ
	'1A02':'7',//���Ҽ���ְ
	'1A11':'8',//ʡ������ְ
	'1A12':'9',//ʡ������ְ
	'1A21':'10',//���ּ���ְ
	'1A22':'11',//���ּ���ְ
	'1A31':'12',//�ش�����ְ
	'1A32':'13',//�ش�����ְ
	'1A41':'14',//��Ƽ���ְ
	'1A42':'15',//��Ƽ���ְ
	'1A50':'16',//��Ա 
	'1A60':'17',//����Ա 
	'1A98':'18',//��������Ա
	'1A99':'19',//���� 
	//'01A':'',//�ۺϹ�����    
	//'01B':'',//רҵ������    
	'1B01':'21',//һ���ܼ�     
	'1B02':'22',//�����ܼ�     
	'1B03':'23',//һ���߼�����
	'1B04':'24',//�����߼�����
	'1B05':'25',//�����߼�����
	'1B06':'26',//�ļ��߼�����
	'1B07':'27',//һ������
	'1B08':'28',//��������
	'1B09':'29',//��������
	'1B10':'30',//�ļ�����
	'1B11':'31',//רҵ����Ա
	'1B98':'32',//��������Ա
	'1B99':'33',//����
	//'01C':'',//����ִ����
	'1C01':'35',//����  
	'1C02':'36',//һ���߼�����
	'1C03':'37',//�����߼�����
	'1C04':'38',//�����߼�����
	'1C05':'39',//�ļ��߼�����
	'1C06':'40',//һ������
	'1C07':'41',//��������
	'1C08':'42',//��������
	'1C09':'43',//�ļ�����
	'1C10':'44',//һ������ִ��Ա
	'1C11':'45',//��������ִ��Ա
	'1C98':'46',//��������Ա
	'1C99':'47',//���� 
	//'02':'',//���񾯲쾯Աְ������ 
	'20':'49',//һ������
	'21':'50',//��������
	'22':'51',//��������
	'23':'52',//�ļ�����
	'24':'53',//һ����Ա
	'25':'54',//������Ա
	'26':'55',//������Ա
	'27':'56',//��������Ա
	'28':'57',//���� 	
	
	'301':'59',//��ϯ�󷨹�
	'302':'60',//һ���󷨹�
	'303':'61',//�����󷨹�
	'304':'62',//һ���߼�����
	'305':'63',//�����߼�����
	'306':'64',//�����߼�����
	'307':'65',//�ļ��߼�����
	'308':'66',//һ������
	'309':'67',//��������
	'310':'68',//��������
	'311':'69',//�ļ�����
	'312':'70',//�弶����
	
	'401':'72',//��ϯ�����
	'402':'73',//һ�������
	'403':'74',//���������
	'404':'75',//һ���߼�����
	'405':'76',//�����߼�����
	'406':'77',//�����߼�����
	'407':'78',//�ļ��߼�����
	'408':'79',//һ������
	'409':'80',//��������
	'410':'81',//��������
	'411':'82',//�ļ�����
	'412':'83',//�弶����
	
	'501':'85',//������һ���ܼ�
	'502':'86',//�����������ܼ�
	'503':'87',//������һ������
	'504':'88',//��������������
	'505':'89',//��������������
	'506':'90',//�������ļ�����
	'507':'91',//������һ������
	'508':'92',//��������������
	'509':'93',//��������������
	'510':'94',//�������ļ�����
	'511':'95',//������Ա
	
	'601':'97',//һ������רԱ
	'602':'98',//��������רԱ
	'603':'99',//һ���߼�����
	'604':'100',//�����߼�����
	'605':'101',//�����߼�����
	'606':'102',//�ļ��߼�����
	'607':'103',//һ������
	'608':'104',//��������
	'609':'105',//��������
	'610':'106',//�ļ�����
	'611':'107',//һ����Ա
	'612':'108',//������Ա
	
	'7101':'110',//�߼�ִ��Ա
	'7102':'111',//һ��ִ��Ա
	'7103':'112',//����ִ��Ա
	'7104':'113',//����ִ��Ա
	'7105':'114',//�ļ�ִ��Ա
	'7106':'115',//�弶ִ��Ա
	'7107':'116',//����ִ��Ա
	'7108':'117',//�߼�ִ��Ա
	'7109':'118',//����ִ��Ա
	'7110':'119',//��ϰִ��Ա
	
	'7201':'121',//һ���߼�����
	'7202':'122',//�����߼�����
	'7203':'123',//һ������
	'7204':'124',//��������
	'7205':'125',//��������
	'7206':'126',//�ļ�����
	'7207':'127',//һ����Ա
	'7208':'128',//������Ա
	'7209':'129',//������Ա
	'7210':'130',//�ļ���Ա
	'7211':'131',//������Ա
	'7212':'132',//��ϰ��Ա
	
	'7401':'134',//����Ԥ��������
	'7402':'135',//����Ԥ���߼�����
	'7403':'136',//����Ԥ������
	'7404':'137',//����Ԥ��һ������
	'7405':'138',//����Ԥ����������
	'7406':'139',//����Ԥ����������
	'7407':'140',//����Ԥ������
	
	'7501':'142',//������Ϣ�߼�����
	'7502':'143',//������Ϣ����
	'7503':'144',//������Ϣһ������
	'7504':'145',//������Ϣ��������
	'7505':'146',//������Ϣ��������
	'7506':'147',//������Ϣ����

	'7301':'149',//һ����������
	'7302':'150',//������������
	'7303':'151',//������������
	'7304':'152',//�ļ���������
	'7305':'153',//�弶��������
	'7306':'154',//������������
	'7307':'155',//�߼���������
	'7308':'156',//�˼���������
	'7309':'157',//�ż���������
	'7310':'158',//ʮ����������
	
	'901':'160',//һ��ְԱ
	'902':'161',//����ְԱ
	'903':'162',//����ְԱ
	'904':'163',//�ļ�ְԱ
	'905':'164',//�弶ְԱ
	'906':'165',//����ְԱ
	'907':'166',//�߼�ְԱ
	'908':'167',//�˼�ְԱ
	'909':'168',//�ż�ְԱ
	'910':'169',//ʮ��ְԱ
	'911':'170',//��������Ա
	'912':'171',//����
		
	//'C':'172',//��ҵ��λרҵ������λ           
	'C01':'173',// ����һ�������߼���         
	'C02':'174',//�������������߼���          
	'C03':'175',//�������������߼���          
	'C04':'176',//�����ļ������߼���          
	'C05':'177',//�����弶�����߼���          
	'C06':'178',//�������������߼���          
	'C07':'179',//�����߼������߼���          
	'C08':'180',//�����˼����м���           
	'C09':'181',//�����ż����м���           
	'C10':'182',//����ʮ�����м���           
	'C11':'183',//����ʮһ����������         
	'C12':'184',//����ʮ������������         
	'C13':'185',// ����ʮ������������        
	'C98':'186',// ��������Ա             
	'C99':'187',//����                 
	                           
	//'D':'188',//���ؼ������˸�λ             
	'D01':'189',//�߼���ʦ               
	'D02':'190',//��ʦ                 
	'D03':'191',//�߼���������             
	'D04':'192',//�м���������             
	'D05':'193',//������������             
	'D09':'194',//ѧͽ��������             
	                           
	//'E':'',//������ͨ���˸�λ             
	'E01':'196',//������ͨ����             
	'E09':'197',//����                 
	                           
	//'F':'',//��ҵ��λ�������˸�λ           
	'F01':'199',//������һ�����߼���ʦ��        
	'F02':'200',//��������������ʦ��          
	'F03':'201',//�������������߼�����         
	'F04':'202',//�������ļ����м�����         
	'F05':'203',//�������弶����������         
	'F09':'204',//ѧͽ��������             
	                           
	//'G':'205',//��ҵ��λ��ͨ���˸�λ           
	'G01':'206',//������ͨ����             
	'G09':'207'//���� 
		//208
		};
//�г�ְλ���������  �������Ķ�Ӧ��ϵ
var map_zwlb={
		'1A':'6,19',//�ۺϹ�����
		'1B':'21,33',//רҵ������
		'1C':'35,47',//����ִ����
		'2':'49,57',//���񾯲쾯Աְ������
		'3':'59,70',//���ٵȼ�
		'4':'72,83',//���ٵȼ�
		'5':'85,95',//�������ȼ�
		'6':'97,108',//ִ������Աְ��ȼ�
		'71':'110,119',//������ִ��Ա
		'72':'121,132',//�����о�Ա
		'74':'134,140',//����������Ԥ��Ա
		'75':'142,147',//������������ϢԱ
		'73':'149,158',//���ھ�����ְ��
		'9':'160,171',//��ҵ��λ����ȼ�
		'C':'173,187',//��ҵ��λרҵ������λ
		'D':'189,194',//���ؼ������˸�λ
		'E':'196,197',//������ͨ���˸�λ
		'F':'199,204',//��ҵ��λ�������˸�λ
		'G':'206,207',//��ҵ��λ��ͨ���˸�λ
		'QT':'208,208'//��ҵ��λ����ȼ�
	  };
var array_row=new Array(
		'6,19',//�ۺϹ����๫��Ա
		'21,33',//רҵ�����๫��Ա
		'35,47',//����ִ���๫��Ա
		'49,57',//���񾯲�ְ������
		'59,70',//���ٵȼ�
		'72,83',//���ٵȼ�
		'85,95',//�������ȼ�
		'97,108',//ִ������Աְ��ȼ�
		'110,119',//������ִ��Ա
		'121,132',//�����о�Ա
		'134,140',//����������Ԥ��Ա
		'142,147',//������������ϢԱ
		'149,158',//���ھ�����ְ��
		'160,171',//��ҵ��λ����ȼ�
		'173,187',//��ҵ��λרҵ������λ
		'189,194',//���ؼ������˸�λ
		'196,197',//������ͨ���˸�λ
		'199,204',//��ҵ��λ�������˸�λ
		'206,207'//��ҵ��λ��ͨ���˸�λ
);
//ͳ����Ŀ����
var tjxm_arr = new Array(
		"",
		"",
		"",
		"",
		"Ů",
		"",
		"��������",
		"",
		"�й���Ա",
		"",
		"���й���Ա",
		"",
		"�о���",
		"",
		"��ѧ����",
		"",
		"��ѧר��",
		"",
		"��ר",
		"",
		"���м�����",
		"",
		"��ʿ",
		"",
		"˶ʿ",
		"",
		"ѧʿ",
		"",
		"35�꼰����",
		"",
		"36����40��",
		"",
		"41����45��",
		"",
		"46����50��",
		"",
		"51����54��",
		"",
		"55����59��",
		"",
		"60�꼰����",
		"",
		"ƽ������",
		"����1��",
		"",
		"1��������3��",
		"",
		"3��������5��",
		"",
		"5��������10��",
		"",
		"10�꼰����",
		"",
		"����2�����ϻ��㹤������"
		);