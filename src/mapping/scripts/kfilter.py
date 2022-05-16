import numy as np

class Kf:
        def __init__(self,inital_theta:float,initial_theta_s:float,cnt_var:float,estim_variance:float)->None:
            self.theta = np.zeros((numstatevar,1))
            self.theta[theta_index] = inital_theta
            self.theta[theta_s_index] = initial_theta_s
            self.cnt_var = cnt_var   #-9.81
            self.estim_variance=estim_variance

            self.P = np.eye(numstatevar)

        def predict(self,dt:float)->None:
            noise = np.random.randn()

            F = np.eye(numstatevar)
            F[theta_index,theta_s_index]=dt

            B = np.zeros((numstatevar,1))
            B[theta_index]=(dt**2)*0.5
            B[theta_s_index]=dt
            Q = B.dot(B.T).dot(self.estim_variance) #estimate covariance error matrix (B*B.T*(estimate_variance))

            new_theta = F.dot(self.theta) + B.dot(self.cnt_var) + noise/10 #new estimate

            new_P = F.dot(self.P).dot(F.T)+Q #new process covariance matrix
            self.P = new_P
            self.theta = new_theta
            #print('Old Process Covariance matrix',self.P,end='')
            print('Old State Vector',self.theta,'\n')

        def update(self,meas_theta:float,meas_theta_s:float,meas_variance:float):
            H = np.zeros((1,numstatevar))
            H[0,theta_index] = 1
            H[0,theta_s_index] = 1

            z = np.array([meas_theta])
            R = np.sqrt(H.dot(H.T)).dot(np.array([[meas_variance]]))
            #R = np.array([[meas_variance]])
            S = H.dot(self.P).dot(H.T)+R

            K = self.P.dot(H.T)*np.linalg.inv(S)


            new_theta = self.theta+ K.dot(z-H.dot(self.theta))
            new_P = (np.eye(2)-K.dot(H)).dot(self.P)
            self.P = new_P
            self.theta = new_theta
            #print('New Process covariance matrix',self.P)

            print('New State Vector',self.theta,'\n\n')

        def cov(self)->np.array:
            return self.P

        def statevec(self)->np.array:
            return self.theta