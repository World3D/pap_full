--��֮����

--MisDescBegin
x208012_g_ScriptId = 208012
--x208012_g_MissionIdPre =40
x208012_g_MissionId = 66
x208012_g_MissionKind = 12
x208012_g_MissionLevel = 60
--x208012_g_ScriptIdNext = {ScriptId = 208003 ,LV = 1 }
x208012_g_Name	="Ү�ɳ���" 
x208012_g_Name2	="�ɼ�˼��" 
--x208012_g_DemandItem ={{id=13010003,num=1}}
--x208012_g_noDemandKill ={{id=301,num=1}}	

x208012_g_MissionName="��֮����"
x208012_g_MissionInfo="    ��������֮ս��ʦ�������������ɹž�����������ǿ��ľ��ӣ���˹���̳���Ϊ�˾�ȫ�ǰ��գ����˳��ţ�����ֻ��һ��Ҫ�󣬾��ǷŹ�ȫ�ǵİ��գ����Ѿ�Ӧ���ˡ�\n \n    �����˹�֮���������ң���Щ����û�еֿ����Ǵ����"  --��������
x208012_g_MissionInfo2="���ҿ��󺹶��������࿴���������������Ȱ��󺹣������ƴ����ա�"
x208012_g_MissionTarget="    Ү�ɳ���ϣ������Ȱ˵#G�ɼ�˼��#W���Ź��޹��İ��ա�"		
x208012_g_MissionComplete="    ������Ү�ɳ��ĵ���˼�����Ļ��е����һ�������һ�ݸ�ʾ������Щ���շ��ġ�"					--�������npc˵���Ļ�
--x208012_g_ContinueInfo="    ���ܸ��������ۣ�ҲҪ���Ǽ��������û�����"
--������
x208012_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x208012_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x208012_g_RadioItemBonus={}

--MisDescEnd
x208012_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x208012_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x208012_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x208012_g_MissionId) > 0 then
		
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x208012_g_MissionName)
		     AddText(sceneId,x208012_g_MissionComplete)
		     AddMoneyBonus(sceneId, x208012_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x208012_g_ScriptId, x208012_g_MissionId)
                

        elseif x208012_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x208012_g_MissionName)
                AddText(sceneId,x208012_g_MissionInfo..GetName(sceneId, selfId)..x208012_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x208012_g_MissionTarget) 
		AddMoneyBonus(sceneId, x208012_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x208012_g_ScriptId, x208012_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x208012_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x208012_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x208012_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x208012_g_ScriptId, x208012_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x208012_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208012_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x208012_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==8) then
        	if (GetName(sceneId,targetId)==x208012_g_Name) then
        	        if IsHaveMission(sceneId,selfId, x208012_g_MissionId)<= 0 then
        	            	return 1
        	        end
        	end
		if (GetName(sceneId,targetId)==x208012_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x208012_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x208012_OnAccept(sceneId, selfId)

	                                                  
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x208012_g_MissionId, x208012_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x208012_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	     	                                    
	     
end



--**********************************

--����

--**********************************

function x208012_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x208012_g_MissionId)
	for i, item in x208012_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x208012_CheckSubmit( sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x208012_g_Name2) then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x208012_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x208012_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x208012_g_MissionId)
		AddExp(sceneId, selfId, x208012_g_ExpBonus)
		AddMoney(sceneId, selfId, x208012_g_MoneyBonus)
		for i, item in x208012_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		
		--CallScriptFunction( x208012_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x208012_OnKillObject(sceneId, selfId, objdataId)
	 

end



--**********************************

--���������¼�

--**********************************

function x208012_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x208012_OnItemChanged(sceneId, selfId, itemdataId)

end

